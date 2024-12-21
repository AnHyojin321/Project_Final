package com.kh.admin.lesson.model.service;

import java.util.List;

import com.kh.admin.common.model.vo.PageInfo;
import com.kh.admin.lesson.model.vo.Lesson;

public interface LessonService {

	// 게시글 총 갯수 조
    // 페이징 처리: 총 강습 예약 수 조회
    int selectLessonCount();

    // 페이징 처리: 페이징된 강습 리스트 조회
    List<Lesson> selectLessonList(PageInfo pi);
    // 전체 강습 예약 리스트 조회
    List<Lesson> selectAllLessons();

    // 예약 상태 변경
    int updateLessonStatus(int resNo, String resStatus);
}
