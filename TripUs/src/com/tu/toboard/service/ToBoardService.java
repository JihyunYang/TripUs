package com.tu.toboard.service;

/**
FileName (���ϸ�): ToBoardService.java
Explanation (����): ToBoardService page
Date Written (�ۼ���): 2019.9.20
Writer (�ۼ���): YJH
*/

import java.util.List;

import com.tu.toboard.vo.ToBoardVO;

public interface ToBoardService {
	public List<ToBoardVO> toBoardList(ToBoardVO tovo);
}//End of ToBoardService interface block
