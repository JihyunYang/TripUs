package com.tu.coboard.service;
/**
클래스명 : MyCourseService
날 짜 : 2019-09-10
작성자명 : 김 해 원
*/


import java.util.List;

import com.tu.coboard.vo.MyCourseVO;


public interface MyCourseService {
	public List<MyCourseVO> myCourseList(MyCourseVO mvo);
	public int insertCourse(MyCourseVO mvo);
	public int updateCourse(MyCourseVO mvo);
}
