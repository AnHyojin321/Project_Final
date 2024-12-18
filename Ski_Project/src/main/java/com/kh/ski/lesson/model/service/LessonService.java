package com.kh.ski.lesson.model.service;

import java.util.ArrayList;

import com.kh.ski.common.model.vo.PageInfo;
import com.kh.ski.lesson.model.vo.Lesson;

public interface LessonService {
	
	// 게시글 총 갯수 조회
	int selectListCount(String keyword);
	
	// 게시글 목록 조회
	ArrayList<Lesson> selectList(PageInfo pi, String keyword);
	
	// 강습 예약 작성하기 서비스
	int insertLesson(Lesson les);
	
	// 예약(본인) 게시글 상세 조회
	Lesson selectLesson(int resNo);
	
	// 예약 게시글 수정
	int updateLesson(Lesson les);
	
	// 예약 게시글 삭제
	int deleteLesson(int resNo);
	
	
	
	
	
	
}
