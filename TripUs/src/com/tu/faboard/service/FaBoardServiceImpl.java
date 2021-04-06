package com.tu.faboard.service;

/**
FileName (���ϸ�): FaBoardServiceImpl.java
Explanation (����): FaBoardServiceImpl page
Date Written (�ۼ���): 2019.9.20
Writer (�ۼ���): YJH
*/

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tu.faboard.dao.FaBoardDAO;
import com.tu.faboard.vo.FaVO;

@Service
@Transactional 
public class FaBoardServiceImpl implements FaBoardService {

	@Autowired 
	private FaBoardDAO faBoardDao;

	//FAQ Main Page
	@Override
	public List<FaVO> faBoardList(FaVO fvo) {
		System.out.println("FaBoardServiceImpl.faBoardList SUCCESS >>> : ");
		
		List<FaVO> faList = new ArrayList<FaVO>();
		faList= faBoardDao.faBoardList(fvo);
			System.out.println("FaBoardServiceImpl.faBoardList  faList confirm >>> : " + faList);
		
		return faList;
	}//End of faBoardList method block
	
	//FAQ Insert Write Form page 
	@Override
	public FaVO faBoardSelect(FaVO fvo) {
		System.out.println("FaBoardServiceImpl.faBoardSelect SUCCESS >>> : ");
		
		return faBoardDao.faBoardSelect(fvo);
	}//End of faBoardSelect method block

	//FAQ Insert Page
	@Override
	public int faBoardInsert(FaVO fvo) {
		System.out.println("FaBoardServiceImpl.faBoardInsert SUCCESS >>> : ");
		
		return faBoardDao.faBoardInsert(fvo);
	}//End of faBoardInsert method block

	//FAQ Update Page
	@Override
	public int faBoardUpdate(FaVO fvo) {
		System.out.println("FaBoardServiceImpl.faBoardUpdate SUCCESS >>> : ");
		
		return faBoardDao.faBoardUpdate(fvo);
	}//End of faBoardUpdate method block

	//FAQ Delete Page
	@Override
	public int faBoardDelete(FaVO fvo) {
		System.out.println("FaBoardServiceImpl.faBoardDelete SUCCESS >>> : ");
		
		return faBoardDao.faBoardDelete(fvo);
	}//End of faBoardDelete method block
	
	//paging (����¡ ���ϴ� �޼���)
	@Override
	public List faBoardListCount(Map map) {
		List<FaVO> pagintList = new ArrayList<FaVO>();
		pagintList= faBoardDao.faBoardListCount(map);
			System.out.println("FaBoardServiceImpl.faBoardListCount  SUCCESS >>> : ");
			System.out.println("FaBoardServiceImpl.faBoardListCount pagintList confirm >>> : " + pagintList);
		
		return faBoardDao.faBoardListCount(map);
	}//End of faBoardListCount method block
}//End of FaBoardServiceImpl class block

