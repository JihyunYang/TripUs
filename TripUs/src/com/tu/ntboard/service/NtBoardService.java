package com.tu.ntboard.service;

/**
FileName (���ϸ�): NtBoardService.java
Explanation (����): NtBoardService page
Date Written (�ۼ���): 2019.9.20
Writer (�ۼ���): YJH
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
