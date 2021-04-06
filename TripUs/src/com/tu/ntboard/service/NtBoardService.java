package com.tu.ntboard.service;

/**
FileName (파일명): NtBoardService.java
Explanation (설명): NtBoardService page
Date Written (작성일): 2019.9.20
Writer (작성자): YJH
*/

import java.util.List;
import java.util.Map;

import com.tu.ntboard.vo.NtBoardVO;

public interface NtBoardService {
	List<NtBoardVO> ntBoardList(NtBoardVO ntvo);
	public int ntBoardInsert(NtBoardVO ntvo);
	public NtBoardVO ntBoardDetail(NtBoardVO ntvo);
	public int ntBoardUpdate(NtBoardVO ntvo);
	public int ntBoardDelete(NtBoardVO ntvo);
	public int ntBoardListCnt(NtBoardVO ntvo);
	public int ntUpdateViewCnt(NtBoardVO ntvo);
	List ntBoardListCount(Map map);
}//End of NtBoardService interface block
