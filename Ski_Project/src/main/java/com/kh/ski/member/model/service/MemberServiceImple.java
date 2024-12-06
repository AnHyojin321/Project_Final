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

	@Override
	public int sendCertNo(String email) {
		
		return memberDao.sendCertNo(sqlSession, email);
	}

	@Override
	public int validate(String email, String certNo) {
		
		return memberDao.validate(sqlSession, email, certNo);
	}
	
	@Override
	@Transactional
	public int insertEmailCert(String email, String certNo) {
	    System.out.println("Service - 이메일: " + email);
	    System.out.println("Service - 인증번호: " + certNo);

	    return memberDao.insertEmailCert(sqlSession, email, certNo);
	}

    // 카카오 관련 메서드 구현
    // 이메일로 회원 조회
    @Override
    public Member findByEmail(String email) {
        return memberDao.findByEmail(sqlSession, email);
    }

    // 카카오 로그인 정보 업데이트
    @Override
    public int updateKakaoLogin(Member member) {
        return memberDao.updateKakaoLogin(sqlSession, member);
    }

}
