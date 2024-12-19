package com.kh.admin.member.model.service;

import java.util.List;

import com.kh.admin.member.model.vo.Member;

public interface MemberService {

	// 회원 전체 정보 조회
    List<Member> selectAllMembers();
	
	// 회원 정보 수정
    int updateMemberStatus(int memberNo, String memberStatus);
    // 총 회원 수 조회
    int totalMemberCount();

		
}
