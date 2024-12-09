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


}
	
	
	

