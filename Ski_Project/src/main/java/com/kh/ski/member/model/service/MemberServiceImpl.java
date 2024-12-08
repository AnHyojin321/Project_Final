package com.kh.ski.member.model.service;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;

import com.kh.ski.member.model.dao.MemberDao;
import com.kh.ski.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {


    @Autowired
    private SqlSessionTemplate sqlSession;

    @Autowired
    private MemberDao memberDao;

    private final RestTemplate restTemplate = new RestTemplate();

    @Override
    public Member loginMember(Member m) {
        return memberDao.loginMember(sqlSession, m);
    }

    @Override
    @Transactional
    public int insertMember(Member m) {
        return memberDao.insertMember(sqlSession, m);
    }

    @Override
    public int updateMember(Member m) {
        return 0;
    }

    @Override
    public int deleteMember(String userId) {
        return 0;
    }

    @Override
    public int idCheck(String checkId) {
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
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("email", email.trim().toLowerCase());
        paramMap.put("certNo", certNo);
        return memberDao.insertEmailCert(sqlSession, paramMap);
    }


}