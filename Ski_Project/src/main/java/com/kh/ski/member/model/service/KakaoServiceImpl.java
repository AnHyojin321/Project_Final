package com.kh.ski.member.model.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.JSONObject;
import org.springframework.stereotype.Service;

import com.kh.ski.member.model.vo.KakaoUserInfo;

@Service
public class KakaoServiceImpl implements KakaoService {

    private static final String CLIENT_ID = "f2efc5913b287d02f1ca471e0572580f"; // 카카오 REST API 키
    private static final String REDIRECT_URI = "http://localhost:8090/ski/kakao/callback"; // 리다이렉트 URI

    @Override
    public String getAccessToken(String code) {
        String accessToken = null;

        try {
            URL url = new URL("https://kauth.kakao.com/oauth/token");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            // 요청 파라미터 설정
            String params = "grant_type=authorization_code" +
                            "&client_id=" + CLIENT_ID +
                            "&redirect_uri=" + REDIRECT_URI +
                            "&code=" + code;

            OutputStream os = conn.getOutputStream();
            os.write(params.getBytes());
            os.flush();
            os.close();

            // 응답 데이터 읽기
            int responseCode = conn.getResponseCode();
            if (responseCode == 200) { // 성공
                BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                StringBuilder response = new StringBuilder();
                String line;
                while ((line = br.readLine()) != null) {
                    response.append(line);
                }
                br.close();

                // JSON 파싱
                JSONObject json = new JSONObject(response.toString());
                accessToken = json.getString("access_token");
                System.out.println("Access Token: " + accessToken); // 디버깅용
            } else {
                BufferedReader br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
                StringBuilder errorResponse = new StringBuilder();
                String line;
                while ((line = br.readLine()) != null) {
                    errorResponse.append(line);
                }
                br.close();
                System.err.println("Access Token 요청 실패: " + errorResponse.toString());
            }

        } catch (Exception e) {
            System.err.println("Access Token 요청 중 오류 발생: " + e.getMessage());
            e.printStackTrace();
        }

        return accessToken;
    }

    @Override
    public KakaoUserInfo getUserInfo(String accessToken) {
        KakaoUserInfo kakaoUserInfo = null;

        try {
            URL url = new URL("https://kapi.kakao.com/v2/user/me");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Authorization", "Bearer " + accessToken);

            // 응답 데이터 읽기
            int responseCode = conn.getResponseCode();
            if (responseCode == 200) { // 성공
                BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                StringBuilder response = new StringBuilder();
                String line;
                while ((line = br.readLine()) != null) {
                    response.append(line);
                }
                br.close();

                // JSON 파싱
                JSONObject json = new JSONObject(response.toString());
                String id = String.valueOf(json.getLong("id"));
                String nickname = json.getJSONObject("properties").getString("nickname");

                // 이메일 처리
                String email = null;
                if (json.has("kakao_account") && json.getJSONObject("kakao_account").has("email")) {
                    email = json.getJSONObject("kakao_account").getString("email");
                } else {
                    email = "이메일 없음"; // 기본값 설정
                }

                kakaoUserInfo = new KakaoUserInfo(id, nickname, email);
                System.out.println("Kakao User Info: " + kakaoUserInfo); // 디버깅용
            } else {
                BufferedReader br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
                StringBuilder errorResponse = new StringBuilder();
                String line;
                while ((line = br.readLine()) != null) {
                    errorResponse.append(line);
                }
                br.close();
                System.err.println("사용자 정보 요청 실패: " + errorResponse.toString());
            }

        } catch (Exception e) {
            System.err.println("사용자 정보 요청 중 오류 발생: " + e.getMessage());
            e.printStackTrace();
        }

        return kakaoUserInfo;
    }
}
