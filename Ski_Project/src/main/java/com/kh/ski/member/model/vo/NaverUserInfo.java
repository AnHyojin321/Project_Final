package com.kh.ski.member.model.vo;

public class NaverUserInfo {
    private String id;
    private String nickname;
    private String email;
    private String mobile; // 전화번호
    private String birthDate; // 생년월일 (YYYYMMDD)

    public NaverUserInfo(String id, String nickname, String email, String mobile, String birthDate) {
        this.id = id;
        this.nickname = nickname;
        this.email = email;
        this.mobile = mobile;
        this.birthDate = birthDate;
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

    public String getMobile() {
        return mobile;
    }

    public String getBirthDate() {
        return birthDate; // 생년월일 getter 추가
    }

    @Override
    public String toString() {
        return "NaverUserInfo [id=" + id + ", nickname=" + nickname + ", email=" + email + ", mobile=" + mobile + ", birthDate=" + birthDate + "]";
    }
}
