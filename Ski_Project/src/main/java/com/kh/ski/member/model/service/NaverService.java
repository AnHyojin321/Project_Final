package com.kh.ski.member.model.service;

import com.kh.ski.member.model.vo.NaverUserInfo;

public interface NaverService {

    // 인가 코드로 액세스 토큰 요청
    String getAccessToken(String code);

    // 액세스 토큰으로 사용자 정보 요청
    NaverUserInfo getUserInfo(String accessToken);
}
