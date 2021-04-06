package com.tu.faboard.service;

/**
FileName (���ϸ�): FaBoardService.java
Explanation (����): FaBoardService page
Date Written (�ۼ���): 2019.9.20
Writer (�ۼ���): YJH
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