package com.tu.coboard.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.tu.coboard.vo.MyCourseVO;

public class MyCourseMapperImpl extends SqlSessionDaoSupport implements MyCourseMapper{
	
	private final String PACKAGE_PATH = "mybatis.query.MyCourseDAO";
	
	@Override
	public List<MyCourseVO> myCourseList(MyCourseVO mvo){
		return getSqlSession().selectList(PACKAGE_PATH+"myCourseList");
	}
	@Override
	public int insertCourse(MyCourseVO mvo){
		return getSqlSession().insert(PACKAGE_PATH+"insertCourse");
	}
	@Override
	public int updateCourse(MyCourseVO mvo){
		return getSqlSession().update(PACKAGE_PATH+"updateCourse");
	}
}
