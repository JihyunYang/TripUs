package com.tu.toboard.dao;

/**
FileName (���ϸ�): ToBoardDao.java
Explanation (����): ToBoardDao page
Date Written (�ۼ���): 2019.9.20
Writer (�ۼ���): YJH
*/

import java.util.List;

import com.tu.toboard.vo.ToBoardVO;

public interface ToBoardDAO {
	public List<ToBoardVO> toBoardList(ToBoardVO tovo);
}//End of ToBoardDao interface block
