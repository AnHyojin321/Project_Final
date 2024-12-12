package com.kh.ski.member.model.service;

import com.kh.ski.member.model.vo.Kakao;
import com.kh.ski.member.model.vo.Member;

public interface MemberService {
	
	// 로그인 서비스 (select)
	Member loginMember(Member m);
	
	// 회원가입 서비스 (insert)
	int insertMember(Member m);
	 	
	// 회원정보수정 서비스 (update)
	int updateMember(Member m);
	
	// 회원탈퇴 서비스 (delete : update 구문을 이용할 것)
	int deleteMember(String userId);
	
	// 아이디 중복체크 서비스 (select)
	int idCheck(String checkId);
	
	// 이메일 인증번호 생성
	int sendCertNo(String email);
	
	// 이메일 인증번호 대조
	int validate(String email, String certNo);
	
	// 이메일 인증번호 데이터 삽입
	int insertEmailCert(String email, String certNo);

	// 아이디 찾기 
	String findId(String memberName, String email);;

	// 카카오 관련 
	//    Member processKakaoUser(Map<String, Object> userInfo);
//	public String getAccessToken(String authorize_code);
//
//	public Kakao getUserInfo(String access_Token);
//	
	
	String findPwd(String memberId, String email);
	
	int updatePassword(String memberId, String tempPwd);
	
	int changePwd(int memberNo, String newPwd, String currentPwd);
	
	String selectEncPw(int memberNo);
	
    String selectTempPw(int memberNo);
}
