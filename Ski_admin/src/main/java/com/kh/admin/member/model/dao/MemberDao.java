package com.kh.admin.member.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.admin.common.model.vo.PageInfo;
import com.kh.admin.member.model.vo.Member;

@Repository
public class MemberDao {

	
	public int selectListCount(SqlSession sqlSession, String keyword, String memberStatus) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("keyword", keyword);
	    params.put("memberStatus", memberStatus);
	    return sqlSession.selectOne("member.selectListCount", params);
	}

	public List<Member> selectMemberList(SqlSession sqlSession, PageInfo pi, String keyword, String memberStatus) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("keyword", keyword);
	    params.put("memberStatus", memberStatus);

	    int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
	    int limit = pi.getBoardLimit();
	    RowBounds rowBounds = new RowBounds(offset, limit);

	    return sqlSession.selectList("member.selectMemberList", params, rowBounds);
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
