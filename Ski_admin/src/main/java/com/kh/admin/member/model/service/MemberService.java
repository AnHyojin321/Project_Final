package com.kh.admin.member.model.service;

import java.util.List;

import com.kh.admin.common.model.vo.PageInfo;
import com.kh.admin.member.model.vo.Member;

public interface MemberService {

	// 총 회원 수 조회
	int selectListCount(String keyword, String memberStatus);

	// 페이징된 회원 리스트 조회
	List<Member> selectMemberList(PageInfo pi, String keyword, String memberStatus);

	
	// 회원 정보 수정
    int updateMemberStatus(int memberNo, String memberStatus);
    // 총 회원 수 조회
    int totalMemberCount();

		
}
