package com.kh.admin.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.admin.common.model.vo.PageInfo;
import com.kh.admin.common.template.Pagination;
import com.kh.admin.member.model.service.MemberService;
import com.kh.admin.member.model.vo.Member;

@Controller
public class MemberController {


    @Autowired
    private MemberService memberService;

    @RequestMapping(value = "members.ad", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView memberList(
            @RequestParam(value = "keyword", required = false) String keyword,
            @RequestParam(value = "memberStatus", required = false) String memberStatus,
            @RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
            @RequestParam(value = "pageSize", defaultValue = "10") int pageSize,
            ModelAndView mv) {

        // 총 회원 수 조회
        int listCount = memberService.selectListCount(keyword, memberStatus);

        // 페이징 처리
        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, pageSize);

        // 회원 리스트 조회
        List<Member> memberList = memberService.selectMemberList(pi, keyword, memberStatus);

        mv.addObject("pi", pi);
        mv.addObject("memberList", memberList);
        mv.addObject("keyword", keyword);
        mv.addObject("memberStatus", memberStatus);
        mv.addObject("pageSize", pageSize);
        mv.setViewName("member/memberList");

        return mv;
    }

    
    @PostMapping("updateStatus.ad")
    @ResponseBody
    public String updateMemberStatus(int memberNo, String memberStatus) {
        System.out.println("받은 데이터: memberNo=" + memberNo + ", memberStatus=" + memberStatus); // 디버깅용

        int result = memberService.updateMemberStatus(memberNo, memberStatus);
        if (result > 0) {
            return "success";
        } else {
            return "fail"; 
        }
    }
    

}
