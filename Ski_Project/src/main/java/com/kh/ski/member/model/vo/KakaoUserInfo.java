package com.kh.ski.member.model.vo;

public class KakaoUserInfo {
    private String id; // 카카오 고유 ID
    private String nickname; // 카카오 닉네임
    private String email; // 카카오 이메일

    public KakaoUserInfo(String id, String nickname, String email) {
        this.id = id;
        this.nickname = nickname;
        this.email = email;
    }

    public String getId() {
        return id;
    }

    public String getNickname() {
        return nickname;
    }

    public String getEmail() {
        return email;
    }

    @Override
    public String toString() {
        return "KakaoUserInfo [id=" + id + ", nickname=" + nickname + ", email=" + email + "]";
    }
}
