package com.tu.faboard.dao;

/**
FileName (파일명): FaBoardDAO.java
Explanation (설명): FaBoardDAO page
Date Written (작성일): 2019.9.20
Writer (작성자): YJH
*/

import java.util.List;
import java.util.Map;

import com.tu.faboard.vo.FaVO;

public interface FaBoardDAO {
	public List<FaVO> faBoardList(FaVO fvo);
	public FaVO faBoardSelect(FaVO fvo);
	public int faBoardInsert(FaVO fvo);
	public int faBoardUpdate(FaVO fvo);
	public int faBoardDelete(FaVO fvo);
	public List faBoardListCount(Map map);
}//End of FaBoardDAO interface block
