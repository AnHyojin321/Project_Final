package com.kh.ski.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.ski.member.model.dao.MemberDao;
import com.kh.ski.member.model.vo.Member;

@Service
public class MemberServiceImple implements MemberService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao memberDao;
	
	
	@Override
	public Member loginMember(Member m) {
		// TODO Auto-generated method stub
		return memberDao.loginMember(sqlSession, m);
	}

	@Override
	@Transactional
	public int insertMember(Member m) {
		// TODO Auto-generated method stub
		return memberDao.insertMember(sqlSession, m);
	}

	@Override
	public int updateMember(Member m) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMember(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int idCheck(String checkId) {
		// TODO Auto-generated method stub
		return memberDao.idCheck(sqlSession, checkId);
	}

}
