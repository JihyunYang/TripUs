package com.tu.toboard.service;

/**
FileName (파일명): ToBoardService.java
Explanation (설명): ToBoardService page
Date Written (작성일): 2019.9.20
Writer (작성자): YJH
*/

import java.util.List;

import com.tu.toboard.vo.ToBoardVO;

public interface ToBoardService {
	public List<ToBoardVO> toBoardList(ToBoardVO tovo);
}//End of ToBoardService interface block
