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
	/*
	public int updateMember(SqlSessionTemplate sqlSession, Member m) {

		// update 문 : update 메소드
		return sqlSession.update("memberMapper.updateMember", m);
	}

	public int deleteMember(SqlSessionTemplate sqlSession, String userId) {

		// update 문 : update 메소드
		return sqlSession.update("memberMapper.deleteMember", userId);
	}

		
	*/

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


	public int insertEmailCert(SqlSessionTemplate sqlSession, String email, String certNo) {
	    Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("email", email);
	    paramMap.put("certNo", certNo);
	    paramMap.put("createTime", new java.util.Date()); // 현재 시간 추가

	    System.out.println("DAO - 이메일: " + email);
	    System.out.println("DAO - 인증번호: " + certNo);
	    System.out.println("DAO - 파라미터: " + paramMap);

	    return sqlSession.insert("member.emailCertResultSet", paramMap);
	}


    // 이메일로 회원 조회
    public Member findByEmail(SqlSessionTemplate sqlSession, String email) {
        return sqlSession.selectOne("member.selectByEmail", email);
    }

    // 카카오 로그인 정보 업데이트
    public int updateKakaoLogin(SqlSessionTemplate sqlSession, Member member) {
        return sqlSession.update("member.updateKakaoLogin", member);
    }



		
}
	
	
	
	

