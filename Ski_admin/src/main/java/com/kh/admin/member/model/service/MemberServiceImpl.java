package com.kh.admin.member.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.admin.common.model.vo.PageInfo;
import com.kh.admin.member.model.dao.MemberDao;
import com.kh.admin.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private SqlSessionTemplate sqlSession;

    @Autowired
    private MemberDao memberDao;

    @Override
    public int selectListCount(String keyword, String memberStatus) {
        return memberDao.selectListCount(sqlSession, keyword, memberStatus);
    }

    @Override
    public List<Member> selectMemberList(PageInfo pi, String keyword, String memberStatus) {
        return memberDao.selectMemberList(sqlSession, pi, keyword, memberStatus);
    }

    
    @Override
    @Transactional
    public int updateMemberStatus(int memberNo, String memberStatus) {
        return memberDao.updateMemberStatus(sqlSession, memberNo, memberStatus);
    }
    @Override
    public int totalMemberCount() {
        return memberDao.totalMemberCount(sqlSession);
    }
}
