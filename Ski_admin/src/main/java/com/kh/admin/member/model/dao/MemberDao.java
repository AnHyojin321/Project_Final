package com.kh.admin.member.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.admin.member.model.vo.Member;

@Repository
public class MemberDao {

	
    public List<Member> selectAllMembers(SqlSession sqlSession) {
        return sqlSession.selectList("member.selectAllMembers");
    }

    public int updateMemberStatus(SqlSession sqlSession, int memberNo, String memberStatus) {
        // Map 객체를 사용하여 파라미터 전달
        Map<String, Object> params = new HashMap<>();
        params.put("memberNo", memberNo);
        params.put("memberStatus", memberStatus);

        // MyBatis 쿼리 실행
        return sqlSession.update("member.updateMemberStatus", params);
    }
    

    public int totalMemberCount(SqlSession sqlSession) {
        return sqlSession.selectOne("member.totalMemberCount");
    }

}
