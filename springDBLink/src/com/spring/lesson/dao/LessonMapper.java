package com.spring.lesson.dao;

import java.util.List;

import com.spring.lesson.vo.LessonVO;

public interface LessonMapper {
	public List<LessonVO>listLesson(LessonVO param);
	public LessonVO selectLesson(int no);
	public int insertLesson(LessonVO param);
	public int updateLesson(LessonVO param);
	public int deleteLesson(int no);
}
