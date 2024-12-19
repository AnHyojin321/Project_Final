package com.kh.admin.lesson.model.service;

import java.util.List;

import com.kh.admin.lesson.model.vo.Lesson;

public interface LessonService {

    // 전체 강습 예약 리스트 조회
    List<Lesson> selectAllLessons();

    // 예약 상태 변경
    int updateLessonStatus(int resNo, String lessonStatus);
}
