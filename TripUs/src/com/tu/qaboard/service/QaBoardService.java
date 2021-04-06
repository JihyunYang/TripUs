package com.tu.qaboard.service;

/**
FileName (파일명): QaBoardService.java
Explanation (설명): QaBoardService page
Date Written (작성일): 2019.9.20
Writer (작성자): YJH
*/

import java.util.List;
import java.util.Map;

import com.tu.qaboard.vo.QaBoardVO;

public interface QaBoardService {
	List<QaBoardVO> qaBoardList(QaBoardVO qavo);
	public int qaBoardInsert(QaBoardVO qavo);
	public QaBoardVO qaBoardDetail(QaBoardVO qavo);
	public int qaBoardUpdate(QaBoardVO qavo);
	public int qaBoardDelete(QaBoardVO qavo);
	public String qaBoardQaNoSelect();
	List qaBoardListCount(Map map);
}//End of QaBoardService interface block
