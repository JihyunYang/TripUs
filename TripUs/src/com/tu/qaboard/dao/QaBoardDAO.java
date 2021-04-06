package com.tu.qaboard.dao;

/**
FileName (���ϸ�): QaBoardDAO.java
Explanation (����): QaBoardDAO page
Date Written (�ۼ���): 2019.9.20
Writer (�ۼ���): YJH
*/

import java.util.List;
import java.util.Map;

import com.tu.qaboard.vo.QaBoardVO;

public interface QaBoardDAO {
	List<QaBoardVO> qaBoardList(QaBoardVO qavo);
	public int qaBoardInsert(QaBoardVO qavo);
	public QaBoardVO qaBoardDetail(QaBoardVO qavo);
	public int qaBoardUpdate(QaBoardVO qavo);
	public int qaBoardDelete(QaBoardVO qavo);
	public String qaBoardQaNoSelect();
	List qaBoardListCount(Map map);
}//End of QaBoardDAO interface block
