package com.kh.admin.lift.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.admin.common.model.vo.PageInfo;
import com.kh.admin.lift.model.vo.Lift;
import com.kh.admin.lift.model.vo.LiftPurchase;

@Repository
public class LiftDao {

	public ArrayList<Lift> selectLift(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("lift.selectLift");
	}
	
	public int updateLift(SqlSessionTemplate sqlSession, ArrayList<Lift> liftList) {
		return sqlSession.update("lift.updateLift", liftList);
	}

	public int selectListCount(SqlSessionTemplate sqlSession, String keyword, String liftLrefundStatus) {
		Map<String, Object> params = new HashMap<>();
	    params.put("keyword", keyword);
	    params.put("liftLrefundStatus", liftLrefundStatus);
	    return sqlSession.selectOne("lift.selectListCount", params);
	}

	public List<LiftPurchase> selectLiftList(SqlSessionTemplate sqlSession, PageInfo pi, String keyword,String liftLrefundStatus) {
		Map<String, Object> params = new HashMap<>();
	    params.put("keyword", keyword);
	    params.put("liftLrefundStatus", liftLrefundStatus);

	    int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
	    int limit = pi.getBoardLimit();
	    RowBounds rowBounds = new RowBounds(offset, limit);

	    return sqlSession.selectList("lift.selectLiftList", params, rowBounds);
	}

}
