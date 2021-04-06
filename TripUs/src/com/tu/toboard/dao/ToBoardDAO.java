package com.tu.toboard.dao;

/**
FileName (파일명): ToBoardDao.java
Explanation (설명): ToBoardDao page
Date Written (작성자): 2019.9.20
Writer (작성일): YJH
*/

import java.util.List;

import com.tu.toboard.vo.ToBoardVO;

public interface ToBoardDAO {
	public List<ToBoardVO> toBoardList(ToBoardVO tovo);
}//End of ToBoardDao interface block
