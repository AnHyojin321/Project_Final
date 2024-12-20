package com.kh.admin.notice.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.admin.common.template.Pagination;
import com.kh.admin.lostitem.model.vo.PageInfo;
import com.kh.admin.notice.model.service.NoticeService;
import com.kh.admin.notice.model.vo.Notice;

@Controller
public class NoticeController {

    @Autowired
    private NoticeService noticeService;

    @Autowired
    private ServletContext servletContext;

    // 공지사항 작성 폼 이동
    @GetMapping("/NoticeForm")
    public String noticeForm() {
        return "notice/noticeForm"; 
    }

    // 공지사항 작성
    @PostMapping("/insertNotice")
    public String insertNotice(
            @RequestParam("noticeTitle") String noticeTitle,
            @RequestParam("noticeContent") String noticeContent,
            Model model) {

        Notice notice = new Notice();
        notice.setNoticeTitle(noticeTitle);
        notice.setNoticeContent(noticeContent);

        int result = noticeService.insertNotice(notice);

        if (result > 0) {
            model.addAttribute("msg", "공지사항이 성공적으로 등록되었습니다.");
            return "redirect:/noticeList"; // 성공 시 게시물 목록으로 리다이렉트
        } else {
            model.addAttribute("msg", "공지사항 등록에 실패했습니다.");
            return "redirect:/noticeForm"; // 실패 시 등록 폼으로 리다이렉트
        }
    }

    @GetMapping("/noticeList")
    public String selectNoticeList(
            @RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
            Model model) {

        int listCount = noticeService.selectListCount();

        int pageLimit = 5;   // 하단 페이지 번호 최대 개수
        int boardLimit = 10; // 한 페이지에 표시할 게시글 수
        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

        Map<String, Integer> paramMap = new HashMap<>();
        paramMap.put("startRow", (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1);
        paramMap.put("endRow", pi.getCurrentPage() * pi.getBoardLimit());
        List<Notice> list = noticeService.selectNoticeListPaging(paramMap);

        // 디버깅 코드 추가
        System.out.println("공지사항 목록 데이터: " + list);

        model.addAttribute("list", list);
        model.addAttribute("pi", pi);

        return "notice/noticeList";
    }


    // 공지사항 상세보기
    @GetMapping("/noticeDetail")
    public String selectNoticeDetail(@RequestParam("noticeNo") int noticeNo, Model model) {


        // 게시글 정보 조회
        Notice notice = noticeService.selectNoticeDetail(noticeNo);

        // 조회된 게시글 정보를 모델에 추가
        model.addAttribute("notice", notice);

        // 상세보기 페이지로 이동
        return "notice/noticeDetail"; // JSP 경로
    }

    // 이미지 업로드
    @PostMapping("/notice/uploadImage")
    @ResponseBody
    public Map<String, String> uploadImage(@RequestParam("file") MultipartFile file) {
        Map<String, String> response = new HashMap<>();
        try {
            // 파일 저장 경로 설정
            String savePath = servletContext.getRealPath("/resources/upload/");
            File directory = new File(savePath);
            if (!directory.exists()) {
                directory.mkdirs(); // 디렉토리 생성
            }

            String originalFileName = file.getOriginalFilename();
            String saveFileName = UUID.randomUUID().toString() + "_" + originalFileName;

            File saveFile = new File(savePath, saveFileName);
            file.transferTo(saveFile);

            // 업로드된 이미지 URL 반환
            response.put("url", "/resources/upload/" + saveFileName);
        } catch (IOException e) {
            e.printStackTrace();
            response.put("error", "파일 업로드 실패");
        }
        return response;
    }

    // 공지사항 삭제
    @GetMapping("/deleteNotice")
    public String deleteNotice(@RequestParam("noticeNo") int noticeNo, RedirectAttributes redirectAttributes) {
        int result = noticeService.deleteNotice(noticeNo);

        if (result > 0) {
            redirectAttributes.addFlashAttribute("msg", "게시물이 삭제되었습니다.");
        } else {
            redirectAttributes.addFlashAttribute("msg", "게시물 삭제에 실패했습니다.");
        }
        return "redirect:/noticeList";
    }
    
    //공지사항 수정
    
    @GetMapping("/updateNoticeForm")
    public String updateNoticeForm(@RequestParam("noticeNo") int noticeNo, Model model) {
        // 공지사항 상세 정보 가져오기
        Notice notice = noticeService.selectNoticeDetail(noticeNo);
        model.addAttribute("notice", notice);
        return "notice/updateNoticeForm"; // 수정 폼 JSP
    }

    @PostMapping("/updateNotice")
    public String updateNotice(Notice notice, RedirectAttributes redirectAttributes) {
        int result = noticeService.updateNotice(notice);

        if (result > 0) {
            redirectAttributes.addFlashAttribute("msg", "공지사항이 성공적으로 수정되었습니다.");
        } else {
            redirectAttributes.addFlashAttribute("msg", "공지사항 수정에 실패했습니다.");
        }

        return "redirect:/noticeList";
    }
}
