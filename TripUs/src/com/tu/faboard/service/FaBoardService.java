package com.tu.faboard.service;

/**
FileName (파일명): FaBoardService.java
Explanation (설명): FaBoardService page
Date Written (작성일): 2019.9.20
Writer (작성자): YJH
*/

import java.util.List;
import java.util.Map;

import com.tu.faboard.vo.FaVO;

public interface FaBoardService{
	public List<FaVO> faBoardList(FaVO fvo);
	public FaVO faBoardSelect(FaVO fvo);
	public int faBoardInsert(FaVO fvo);
	public int faBoardUpdate(FaVO fvo);
	public int faBoardDelete(FaVO fvo);
	public List faBoardListCount(Map map);
}//End of FaBoardService interface block