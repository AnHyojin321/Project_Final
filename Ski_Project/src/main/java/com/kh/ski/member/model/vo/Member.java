package com.kh.ski.member.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

// 24/12/05 김동준
@NoArgsConstructor
@Getter
@Setter
@ToString
public class Member {
	

	private int memberNo;//	MEMBER_NO	NUMBER
	private String memberId;//	MEMBER_ID	VARCHAR2(30 BYTE)
	private String memberPwd;//	MEMBER_PWD	VARCHAR2(100 BYTE)
	private String memberName;//	MEMBER_NAME	VARCHAR2(20 BYTE)
	private String email;//	EMAIL	VARCHAR2(50 BYTE)
	private String phone;//	PHONE	VARCHAR2(13 BYTE)
	private Date birthDate;//	BIRTH_DATE	DATE
	private String address;//	ADDRESS	VARCHAR2(50 BYTE)
	private Date createDate;//	CREATE_DATE	DATE
	private String kakaoLogin;//	KAKAO_LOGIN	VARCHAR2(30 BYTE)
	private String googleLogin;//	GOOGLE_LOGIN	VARCHAR2(30 BYTE)
	private String memberStatus;//	MEMBER_STATUS	CHAR(1 BYTE)
	
	
	
	
	
	
	
}
