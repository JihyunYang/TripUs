package com.tu.qaboard.service;

/**
FileName (파일명): QaBoardServiceImpl.java
Explanation (설명): QaBoardServiceImpl page
Date Written (작성일): 2019.9.20
Writer (작성자): YJH
*/

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tu.qaboard.dao.QaBoardDAO;
import com.tu.qaboard.vo.QaBoardVO;

@Service
@Transactional
public class QaBoardServiceImpl implements QaBoardService  {

	@Autowired
	private QaBoardDAO qaBoardDao;
	
	//QnA Main Page
	@Override
	public List<QaBoardVO> qaBoardList(QaBoardVO qavo) {
		System.out.println("QaBoardServiceImpl.qaBoardList SUCCESS >>> : ");
		
		List<QaBoardVO> qaList = new ArrayList<QaBoardVO>();
		qaList = qaBoardDao.qaBoardList(qavo);
			System.out.println("QaBoardServiceImpl.qaBoardList qaList confirm >>> : " + qaList);
		
		return qaList;
	}//End of qaBoardList method block
	
	//QnA Insert Page 
	@Override
	public int qaBoardInsert(QaBoardVO qavo) {
		System.out.println("QaBoardServiceImpl.qaBoardInsert SUCCESS >>> : ");
		
		return qaBoardDao.qaBoardInsert(qavo);
	}//End of qaBoardInsert method block

	//QnA Detail Page
	@Override
	public QaBoardVO qaBoardDetail(QaBoardVO qavo) {
		System.out.println("QaBoardServiceImpl.qaBoardDetail SUCCESS >>> : ");
		
		return qaBoardDao.qaBoardDetail(qavo);
	}//End of qaBoardInsert method block
	
	//QnA Update Page
	@Override
	public int qaBoardUpdate(QaBoardVO qavo) {
		System.out.println("QaBoardServiceImpl.qaBoardUpdate SUCCESS >>> : ");
		
		return qaBoardDao.qaBoardUpdate(qavo);
	}//End of qaBoardInsert method block

	//QnA Delete Page
	@Override
	public int qaBoardDelete(QaBoardVO qavo) {
		System.out.println("QaBoardServiceImpl.qaBoardDelete SUCCESS >>> : ");
		
		return qaBoardDao.qaBoardDelete(qavo);
	}//End of qaBoardInsert method block

	//Get the value of the selected qano (선택된 qano의 값을 구하는 메서드)
	@Override
	public String qaBoardQaNoSelect() {
		System.out.println("QaBoardServiceImpl.qaBoardQaNoSelect SUCCESS >>> : ");
		
		return qaBoardDao.qaBoardQaNoSelect();
	}//End of qaBoardQaNoSelect method block

	//paging (페이징 구하는 메서드)
	@Override
	public List qaBoardListCount(Map map) {
		System.out.println("QaBoardServiceImpl.qaBoardListCount SUCCESS >>> : ");
		
		return qaBoardDao.qaBoardListCount(map);
	}//End of qaBoardListCount method block
}//End of QaBoardServiceImpl class block
