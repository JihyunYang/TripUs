package com.tu.fsboard.service;

/**
���ϸ� : FsBoardService
���� : ���� ���� Ŭ����
�ۼ��� : 2019.9.6
�ۼ��� : YJH
*/

import java.util.List;

import com.tu.fsboard.vo.FsBoardVO;

public interface FsBoardService {
	public List<FsBoardVO> selectContentID(FsBoardVO fvo);
	public List<FsBoardVO> fsBoardList(FsBoardVO fvo);
}