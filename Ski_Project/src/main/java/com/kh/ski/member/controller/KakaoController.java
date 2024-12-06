package com.kh.ski.member.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.kh.ski.member.model.service.MemberService;
import com.kh.ski.member.model.vo.Member;

@Controller
@RequestMapping("/ski/login/kakao")
public class KakaoController {

    @Value("${kakao.client-id}")
    private String clientId;

    @Value("${kakao.redirect-uri}")
    private String redirectUri;

    private final MemberService memberService;

    public KakaoController(MemberService memberService) {
        this.memberService = memberService;
    }

    // Kakao 인증 요청
    @GetMapping
    public String redirectToKakao() {
        return "redirect:https://kauth.kakao.com/oauth/authorize?client_id=" + clientId
            + "&redirect_uri=" + redirectUri + "&response_type=code";
    }

    // Kakao 인증 처리 (Redirect URI)
    @GetMapping("/login")
    public String kakaoLogin(@RequestParam("code") String code, Model model) {
        try {
            // Access Token 요청
            HttpHeaders headers = new HttpHeaders();
            headers.add(HttpHeaders.CONTENT_TYPE, "application/x-www-form-urlencoded;charset=utf-8");

            MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
            params.add("grant_type", "authorization_code");
            params.add("client_id", clientId);
            params.add("redirect_uri", redirectUri);
            params.add("code", code);

            HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(params, headers);
            RestTemplate restTemplate = new RestTemplate();
            ResponseEntity<Map> response = restTemplate.postForEntity(
                "https://kauth.kakao.com/oauth/token", request, Map.class);

            Map<String, Object> responseBody = response.getBody();
            String accessToken = (String) responseBody.get("access_token");

            // 사용자 정보 요청
            HttpHeaders userHeaders = new HttpHeaders();
            userHeaders.add(HttpHeaders.AUTHORIZATION, "Bearer " + accessToken);

            HttpEntity<?> userRequest = new HttpEntity<>(userHeaders);
            ResponseEntity<Map> userResponse = restTemplate.exchange(
                "https://kapi.kakao.com/v2/user/me", HttpMethod.GET, userRequest, Map.class);

            Map<String, Object> userBody = userResponse.getBody();
            Long kakaoId = (Long) userBody.get("id");
            String email = (String) ((Map<String, Object>) userBody.get("kakao_account")).get("email");

            // 사용자 확인 및 처리
            Member member = memberService.findByEmail(email);
            if (member == null) {
                member = new Member();
                member.setEmail(email);
                member.setMemberId("kakao_" + kakaoId);
                member.setMemberName("카카오 사용자");
                member.setKakaoLogin(kakaoId.toString());
                memberService.insertMember(member);
            } else if (member.getKakaoLogin() == null) {
                member.setKakaoLogin(kakaoId.toString());
                memberService.updateKakaoLogin(member);
            }

            model.addAttribute("member", member);
            return "redirect:/home";

        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }
}
