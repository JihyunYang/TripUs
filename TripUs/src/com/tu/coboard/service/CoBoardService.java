package com.tu.coboard.service;

/**
Ŭ������ : CoBoardService
�� ¥ : 2019-09-03
�ۼ��ڸ� : �� �� ��
*/

import java.util.List;
import com.tu.coboard.vo.CoBoardVO;

public interface CoBoardService {
	public List<CoBoardVO> selectContentID(CoBoardVO cvo);
	public List<CoBoardVO> coBoardList(CoBoardVO cvo);
	public List<CoBoardVO> coRecommendMainBoard(CoBoardVO cvo);
}
