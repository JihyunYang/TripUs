package com.tu.coboard.dao;

import java.util.List;

import com.tu.coboard.vo.MyCourseVO;

public interface MyCourseMapper {
	public List<MyCourseVO> myCourseList(MyCourseVO mvo);
	public int insertCourse(MyCourseVO mvo);
	public int updateCourse(MyCourseVO mvo);
}
