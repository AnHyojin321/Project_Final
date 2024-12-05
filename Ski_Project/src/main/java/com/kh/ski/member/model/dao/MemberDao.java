package com.kh.ski.member.model.dao;

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

		
}
	
	
	
	

