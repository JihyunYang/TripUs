package com.tu.toboard.service;

/**
FileName (���ϸ�): ToBoardServiceImpl.java
Explanation (����): ToBoardServiceImpl page
Date Written (�ۼ���): 2019.9.20
Writer (�ۼ���): YJH
*/

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tu.toboard.vo.ToBoardVO;
import com.tu.toboard.dao.ToBoardDAO;


@Service 
@Transactional
public class ToBoardServiceImpl implements ToBoardService {
	
	@Autowired
	private ToBoardDAO toBoardDao;
	
	//Tour Main Page
	@Override
	public List<ToBoardVO> toBoardList(ToBoardVO tovo) {
		System.out.println("ToBoardServiceImpl.toBoardList SUCCESS >>> : ");
		
		List<ToBoardVO> toList1 = new ArrayList<ToBoardVO>();
		toList1 = toBoardDao.toBoardList(tovo);
			System.out.println("ToBoardServiceImpl.toBoardList toList confirm >>> : " + toList1);
		
		return toList1;
	}//End of toBoardList method block
}//End of ToBoardServiceImpl class block
