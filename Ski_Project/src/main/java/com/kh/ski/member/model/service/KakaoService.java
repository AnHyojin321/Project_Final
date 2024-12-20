package com.kh.ski.member.model.service;

import com.kh.ski.member.model.vo.KakaoUserInfo;

public interface KakaoService {

    // 인가 코드로 액세스 토큰 요청
    String getAccessToken(String code);

    // 액세스 토큰으로 사용자 정보 요청
    KakaoUserInfo getUserInfo(String accessToken);
}
