package com.tu.ntboard.service;

/**
FileName (���ϸ�): NtBoardServiceImpl.java
Explanation (����): NtBoardServiceImpl page
Date Written (�ۼ���): 2019.9.20
Writer (�ۼ���): YJH
*/

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tu.ntboard.dao.NtBoardDAO;
import com.tu.ntboard.vo.NtBoardVO;

@Service
@Transactional 
public class NtBoardServiceImpl implements NtBoardService{

	@Autowired 
	private NtBoardDAO ntBoardDao;
	
	//Notice Main Page
	@Override
	public List<NtBoardVO> ntBoardList(NtBoardVO ntvo) {
		System.out.println("NtboardServiceImpl.ntBoardList SUCCESS >>> : ");
		
		List<NtBoardVO> ntList = new ArrayList<NtBoardVO>();
		ntList = ntBoardDao.ntBoardList(ntvo);
			System.out.println("NtboardServiceImpl.ntBoardList ntList confirm >>> : " + ntList);
		
		return ntList;
	}//End of ntBoardList method block

	//Notice Insert Page
	@Override
	public int ntBoardInsert(NtBoardVO ntvo) {
		System.out.println("NtboardServiceImpl.ntBoardInsert SUCCESS >>> : ");
		
		return ntBoardDao.ntBoardInsert(ntvo);
	}//End of ntBoardInsert method block
	
	//Notice Detail Page
	@Override
	public NtBoardVO ntBoardDetail(NtBoardVO ntvo) {
		System.out.println("NtboardServiceImpl.ntBoardDetail SUCCESS >>> : ");
			
		return ntBoardDao.ntBoardDetail(ntvo);
	}//End of ntBoardDetail method block
	
	//Notice Update Page
	@Override
	public int ntBoardUpdate(NtBoardVO ntvo) {
		System.out.println("NtboardServiceImpl.ntBoardUpdate SUCCESS >>> : ");
			
		return ntBoardDao.ntBoardUpdate(ntvo);
	}//End of ntBoardUpdate method block
	
	//Notice Delete Page
	@Override
	public int ntBoardDelete(NtBoardVO ntvo) {
		System.out.println("NtboardServiceImpl.ntBoardDelete SUCCESS >>> : ");
		
		return ntBoardDao.ntBoardDelete(ntvo);
	}//End of ntBoardDelete method block

	//Hit Count (��ȸ�� ���ϴ� �޼���)
	@Override
	public int ntUpdateViewCnt(NtBoardVO ntvo) {
		System.out.println("NtboardServiceImpl.ntUpdateViewCnt SUCCESS >>> : ");
			
		return ntBoardDao.ntUpdateViewCnt(ntvo);
	}//End of ntUpdateViewCnt method block
	
	//Get the Total Number of Posts (��ü �Խñ� �� ���ϴ� �޼���)
	@Override
	public int ntBoardListCnt(NtBoardVO ntvo) {
		System.out.println("NtboardServiceImpl.ntBoardListCnt SUCCESS >>> : ");
		
		return ntBoardDao.ntBoardListCnt(ntvo);
	}//End of ntBoardListCnt method block

	//Paging (����¡ ���ϴ� �޼���)
	@Override
	public List ntBoardListCount(Map map) {
		System.out.println("NtboardServiceImpl.ntBoardListCount SUCCESS >>> : ");
		
		return ntBoardDao.ntBoardListCount(map);
	}//End of ntBoardListCount method block
}//End of NtBoardServiceImpl class block
