package com.tu.faboard.dao;

/**
FileName (���ϸ�): FaBoardDAOImpl.java
Explanation (����): FaBoardDAOImpl page
Date Written (�ۼ���): 2019.9.20
Writer (�ۼ���): YJH
*/

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.tu.faboard.vo.FaVO;

public class FaBoardDAOImpl extends SqlSessionDaoSupport implements FaBoardDAO {
	
	//constructor field
	private final String PAKAGE_PATH = "mybatis.query.FaBoardMapper";
	
	//FAQ Main Page
	@Override
	public List<FaVO> faBoardList(FaVO fvo) {
		System.out.println("FaBoardDaoImpl.faBoardList SUCCESS >>> : ");
		
		return getSqlSession().selectList(PAKAGE_PATH + "faBoardList");
	}//End of faBoardList method block

	//FAQ Insert Write Form page 
	@Override
	public FaVO faBoardSelect(FaVO fvo) {
		System.out.println("FaBoardDaoImpl.faBoardSelect SUCCESS >>> : ");
		
		return (FaVO)getSqlSession().selectOne(PAKAGE_PATH + "faBoardSelect");
	}//End of faBoardSelect method block

	//FAQ Insert Page
	@Override
	public int faBoardInsert(FaVO fvo) {
		System.out.println("FaBoardDaoImpl.faBoardInsert SUCCESS >>> : ");
		
		return (int)getSqlSession().insert(PAKAGE_PATH + "faBoardInsert");
	}//End of faBoardInsert method block

	//FAQ Update Page
	@Override
	public int faBoardUpdate(FaVO fvo) {
		System.out.println("FaBoardDaoImpl.faBoardUpdate SUCCESS >>> : ");
		
		return (int)getSqlSession().update(PAKAGE_PATH + "faBoardUpdate");
	}//End of faBoardUpdate method block

	//FAQ Delete Page
	@Override
	public int faBoardDelete(FaVO fvo) {
		System.out.println("FaBoardDaoImpl.faBoardDelete SUCCESS >>> : ");
		
		return (int)getSqlSession().delete(PAKAGE_PATH + "faBoardDelete");
	}//End of faBoardDelete method block

	//paging (����¡ ���ϴ� �޼���)
	@Override
	public List faBoardListCount(Map map) {
		System.out.println("FaBoardDaoImpl.faBoardListCount SUCCESS >>> : ");
		
		return getSqlSession().selectList(PAKAGE_PATH + "faBoardListCount");
	}//End of faBoardListCount method block
}//End of FaBoardDAOImpl class block