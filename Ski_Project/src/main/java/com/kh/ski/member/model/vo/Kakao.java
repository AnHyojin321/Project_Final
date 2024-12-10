package com.kh.ski.member.model.vo;

public class Kakao {
	
	private int k_number;	//    K_NUMBER NUMBER,
	private String k_name;	//    K_NAME VARCHAR2(50),
	private String k_email;	//    K_EMIAL VARCHAR2(50),
	
	public Kakao() {}

	public Kakao(int k_number, String k_name, String k_email) {
		super();
		this.k_number = k_number;
		this.k_name = k_name;
		this.k_email = k_email;
	}

	public int getK_number() {
		return k_number;
	}

	public void setK_number(int k_number) {
		this.k_number = k_number;
	}

	public String getK_name() {
		return k_name;
	}

	public void setK_name(String k_name) {
		this.k_name = k_name;
	}

	public String getK_email() {
		return k_email;
	}

	public void setK_email(String k_email) {
		this.k_email = k_email;
	}

	@Override
	public String toString() {
		return "Kakao [k_number=" + k_number + ", k_name=" + k_name + ", k_email=" + k_email + "]";
	}
	
	
	
}
