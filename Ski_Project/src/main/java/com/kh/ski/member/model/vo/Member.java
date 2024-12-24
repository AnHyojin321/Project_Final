package com.kh.ski.member.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

// 24/12/05 김동준
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
	private String tempPwd;
    private String kakaoAccessToken; // 카카오 액세스 토큰
    private String kakaoRefreshToken; // 카카오 리프레시 토큰
    private String naverLogin;
    private String loginType;
    
	
	public Member() {}






	public Member(int memberNo, String memberId, String memberPwd, String memberName, String email, String phone,
			Date birthDate, String address, Date createDate, String kakaoLogin, String googleLogin, String memberStatus,
			String tempPwd, String kakaoAccessToken, String kakaoRefreshToken, String naverLogin, String loginType) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.email = email;
		this.phone = phone;
		this.birthDate = birthDate;
		this.address = address;
		this.createDate = createDate;
		this.kakaoLogin = kakaoLogin;
		this.googleLogin = googleLogin;
		this.memberStatus = memberStatus;
		this.tempPwd = tempPwd;
		this.kakaoAccessToken = kakaoAccessToken;
		this.kakaoRefreshToken = kakaoRefreshToken;
		this.naverLogin = naverLogin;
		this.loginType = loginType;
	}






	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getKakaoLogin() {
		return kakaoLogin;
	}

	public void setKakaoLogin(String kakaoLogin) {
		this.kakaoLogin = kakaoLogin;
	}

	public String getGoogleLogin() {
		return googleLogin;
	}

	public void setGoogleLogin(String googleLogin) {
		this.googleLogin = googleLogin;
	}

	public String getMemberStatus() {
		return memberStatus;
	}

	public void setMemberStatus(String memberStatus) {
		this.memberStatus = memberStatus;
	}


	public String getTempPwd() {
		return tempPwd;
	}


	public void setTempPwd(String tempPwd) {
		this.tempPwd = tempPwd;
	}


	public String getKakaoAccessToken() {
		return kakaoAccessToken;
	}





	public void setKakaoAccessToken(String kakaoAccessToken) {
		this.kakaoAccessToken = kakaoAccessToken;
	}





	public String getKakaoRefreshToken() {
		return kakaoRefreshToken;
	}





	public void setKakaoRefreshToken(String kakaoRefreshToken) {
		this.kakaoRefreshToken = kakaoRefreshToken;
	}





	public String getNaverLogin() {
		return naverLogin;
	}




	public void setNaverLogin(String naverLogin) {
		this.naverLogin = naverLogin;
	}




	public String getLoginType() {
		return loginType;
	}






	public void setLoginType(String loginType) {
		this.loginType = loginType;
	}






	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberId=" + memberId + ", memberPwd=" + memberPwd + ", memberName="
				+ memberName + ", email=" + email + ", phone=" + phone + ", birthDate=" + birthDate + ", address="
				+ address + ", createDate=" + createDate + ", kakaoLogin=" + kakaoLogin + ", googleLogin=" + googleLogin
				+ ", memberStatus=" + memberStatus + ", tempPwd=" + tempPwd + ", kakaoAccessToken=" + kakaoAccessToken
				+ ", kakaoRefreshToken=" + kakaoRefreshToken + ", naverLogin=" + naverLogin + ", loginType=" + loginType
				+ "]";
	}





	
}
