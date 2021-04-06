package com.tu.coboard.service;

/**
클래스명 : MyCourseServiceImpl
날 짜 : 2019-09-10
작성자명 : 김 해 원
*/

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tu.coboard.dao.MyCourseMapper;
import com.tu.coboard.vo.MyCourseVO;

@Service 
@Transactional
public class MyCourseServiceImpl implements MyCourseService{
	@Autowired
	private MyCourseMapper myCourseMapper;
	
	@Override
	public List<MyCourseVO> myCourseList(MyCourseVO mvo){
		System.out.println("ServiceImpl의 myCourseList함수 진입");
		List<MyCourseVO> list = new ArrayList<MyCourseVO>();
		list = myCourseMapper.myCourseList(mvo);
		
		return list;
	}
	@Override
	public int insertCourse(MyCourseVO mvo){
		System.out.println("ServiceImpl의 insertCourse함수 진입");
		int result = myCourseMapper.insertCourse(mvo);
		
		return result;
	}
	@Override
	public int updateCourse(MyCourseVO mvo){
		System.out.println("ServiceImpl의 updateCourse함수 진입");
		int result = myCourseMapper.updateCourse(mvo);
		
		return result;
	}

}
