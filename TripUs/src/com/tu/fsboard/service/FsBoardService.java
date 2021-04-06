package com.tu.fsboard.service;

/**
파일명 : FsBoardService
설명 : 축제 서비스 클래스
작성일 : 2019.9.6
작성자 : YJH
*/

import java.util.List;

import com.tu.fsboard.vo.FsBoardVO;

public interface FsBoardService {
	public List<FsBoardVO> selectContentID(FsBoardVO fvo);
	public List<FsBoardVO> fsBoardList(FsBoardVO fvo);
}