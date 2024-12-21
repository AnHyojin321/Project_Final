package com.kh.ski.member.model.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


import com.kh.ski.member.model.vo.Member;

@Repository
public class MemberDao {

	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {

		// select문 (단일행 조회) : selectOne 메소드
		return sqlSession.selectOne("member.loginMember", m);
	}
	
	
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		
		// insert 문 : insert 메소드
		return sqlSession.insert("member.insertMember", m);
	}
	
	public int updateMember(SqlSessionTemplate sqlSession, Member m) {

		// update 문 : update 메소드
		return sqlSession.update("member.updateMember", m);
	}

	
	public int deleteMember(SqlSessionTemplate sqlSession, String memberId) {

		// update 문 : update 메소드
		return sqlSession.update("member.deleteMember", memberId);
	}

		
	

	public int idCheck(SqlSessionTemplate sqlSession, String checkId) {
		// select 문 (단일행) : selectOne 메소드
		return sqlSession.selectOne("member.idCheck", checkId);
	}


	public int sendCertNo(SqlSessionTemplate sqlSession, String email) {

		return sqlSession.insert("member.sendCertNo", email);
	}


	public int validate(SqlSessionTemplate sqlSession, String email, String certNo) {

	    Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("email", email);
	    paramMap.put("certNo", certNo);
		
		return sqlSession.selectOne("member.validate", paramMap);
	}


	public int insertEmailCert(SqlSessionTemplate sqlSession, Map<String, Object> paramMap) {
	    // System.out.println("DAO - 파라미터 맵: " + paramMap); // 디버깅 출력

	    return sqlSession.insert("member.insertEmailCert", paramMap);
	}

    public String findId(SqlSessionTemplate sqlSession, String memberName, String email) {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("memberName", memberName);
        paramMap.put("email", email);

        return sqlSession.selectOne("member.findId", paramMap);
    }


	public String findPwd(SqlSessionTemplate sqlSession, String memberId, String email) {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("memberId", memberId);
        paramMap.put("email", email);

        return sqlSession.selectOne("member.findPwd", paramMap);
	}


	public int updatePassword(SqlSessionTemplate sqlSession, String memberId, String encTempPwd) {
	    Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("memberId", memberId);
	    paramMap.put("tempPwd", encTempPwd);

	    System.out.println("updatePassword - memberId: " + memberId + ", 암호화된 임시 비밀번호: " + encTempPwd);

	    return sqlSession.update("member.updatePassword", paramMap);
	}

/*
	public int changePwd(SqlSessionTemplate sqlSession, int memberNo, String newPwd, String currentPwd) {
		// TODO Auto-generated method stub
		Map<String, Object> paramMap = new HashMap<>();	
		paramMap.put("memberNo", memberNo);
		paramMap.put("newPwd", newPwd);
		paramMap.put("currentPwd", currentPwd);
		
		return sqlSession.update("member.changePwd", paramMap);
	}
*/
	
	public int changePwd(SqlSessionTemplate sqlSession, int memberNo, String newPwd) {
	    // 파라미터 맵 생성
	    Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("memberNo", memberNo);
	    paramMap.put("memberPwd", newPwd); // 쿼리에서 #{memberPwd}와 매핑

	    System.out.println("Param Map: " + paramMap); // 디버깅용 로그 출력
	    return sqlSession.update("member.changePwd", paramMap);
	}

	public String selectEncPw(SqlSessionTemplate sqlSession, int memberNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.selectEncPw", memberNo);
	}

	public String selectTempPw(SqlSessionTemplate sqlSession, int memberNo) {
	    return sqlSession.selectOne("member.selectTempPw", memberNo);
	}


    public Member selectKakaoMember(SqlSessionTemplate sqlSession, String kakaoLogin) {
        return sqlSession.selectOne("member.selectKakaoMember", kakaoLogin);
    }


    // 카카오 ID로 회원 조회
    public Member selectMemberByKakaoId(SqlSessionTemplate sqlSession, String kakaoId) {
    	System.out.println("DAO에서 받은 kakaoId: " + kakaoId);
    	return sqlSession.selectOne("member.selectMemberByKakaoId", kakaoId);
    }

    // 카카오 회원가입
    public int insertKakaoMember(SqlSessionTemplate sqlSession, Member member) {
        return sqlSession.insert("member.insertKakaoMember", member);
    }
    public Member findMemberByEmail(SqlSessionTemplate sqlSession, String email) {
        return sqlSession.selectOne("member.findMemberByEmail", email);
    }

    
    
    
    
}
	
	
	

