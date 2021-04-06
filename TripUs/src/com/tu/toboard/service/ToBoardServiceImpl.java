package com.tu.toboard.service;

/**
FileName (파일명): ToBoardServiceImpl.java
Explanation (설명): ToBoardServiceImpl page
Date Written (작성일): 2019.9.20
Writer (작성자): YJH
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
