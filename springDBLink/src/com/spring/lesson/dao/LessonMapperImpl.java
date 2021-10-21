package com.spring.lesson.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.spring.lesson.vo.LessonVO;

public class LessonMapperImpl extends SqlSessionDaoSupport implements LessonMapper {

	private final String PACKAGE_PATH = "com.spring.lesson.dao.LessonDAO.";
	
	@Override
	public List<LessonVO> listLesson(LessonVO param) {
		// TODO Auto-generated method stub
		return getSqlSession().selectList(PACKAGE_PATH + "listLesson");
	}

	@Override
	public LessonVO selectLesson(int no) {
		// TODO Auto-generated method stub
		return (LessonVO)getSqlSession().selectOne(PACKAGE_PATH + "selectLesson");
	}

	@Override
	public int insertLesson(LessonVO param) {
		// TODO Auto-generated method stub
		return (int)getSqlSession().insert(PACKAGE_PATH + "insertLesson");
	}

	@Override
	public int updateLesson(LessonVO param) {
		// TODO Auto-generated method stub
		return (int)getSqlSession().update(PACKAGE_PATH + "updateLesson");
	}

	@Override
	public int deleteLesson(int no) {
		// TODO Auto-generated method stub
		return (int)getSqlSession().delete(PACKAGE_PATH + "deleteLesson");
	}

}
