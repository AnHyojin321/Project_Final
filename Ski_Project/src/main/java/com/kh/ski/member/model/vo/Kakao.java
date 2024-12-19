package com.kh.ski.member.model.vo;

public class Kakao {
	

    public String accessToken;
    public String refreshToken;
    
    public Kakao() {}

	public Kakao(String accessToken, String refreshToken) {
		super();
		this.accessToken = accessToken;
		this.refreshToken = refreshToken;
	}

	public String getAccessToken() {
		return accessToken;
	}

	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
	}

	public String getRefreshToken() {
		return refreshToken;
	}

	public void setRefreshToken(String refreshToken) {
		this.refreshToken = refreshToken;
	}

	@Override
	public String toString() {
		return "Kakao [accessToken=" + accessToken + ", refreshToken=" + refreshToken + "]";
	}

    
	
}
