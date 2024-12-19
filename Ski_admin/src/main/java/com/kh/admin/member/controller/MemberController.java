package com.kh.admin.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.admin.member.model.service.MemberService;
import com.kh.admin.member.model.vo.Member;

@Controller
public class MemberController {


    @Autowired
    private MemberService memberService;

    @GetMapping("members.ad")
    public ModelAndView memberList(ModelAndView mv) {
        // 회원 데이터 가져오기
        List<Member> memberList = memberService.selectAllMembers();

        // 데이터 추가
        mv.addObject("memberList", memberList);
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
