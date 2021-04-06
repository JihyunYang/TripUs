package com.tu.qaboard.service;

/**
FileName (���ϸ�): QaBoardService.java
Explanation (����): QaBoardService page
Date Written (�ۼ���): 2019.9.20
Writer (�ۼ���): YJH
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
