package com.kh.admin.lesson.model.service;

import java.util.List;

import com.kh.admin.common.model.vo.PageInfo;
import com.kh.admin.lesson.model.vo.Lesson;

public interface LessonService {

    // 총 리스트 개수 조회
    int selectListCount(String keyword, String resStatus);

    // 페이징된 예약 리스트 조회
    List<Lesson> selectLessonList(PageInfo pi, String keyword, String resStatus);

    // 예약 상태 변경
    int updateLessonStatus(int resNo, String resStatus);
}
