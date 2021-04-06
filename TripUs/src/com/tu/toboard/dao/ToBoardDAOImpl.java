package com.tu.toboard.dao;

/**
FileName (���ϸ�) : ToBoardDaoImpl.java
Explanation (����): ToBoardDaoImpl page
Date Written (�ۼ���): 2019.9.20
Writer (�ۼ���): YJH
*/

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.tu.toboard.vo.ToBoardVO;

public class ToBoardDAOImpl extends SqlSessionDaoSupport implements ToBoardDAO {
 
	//constructor field
	private final String PACKAGE_PATH = "mybatis.query.ToBoardMapper";
	
	//Tour Main Page
	@Override
	public List<ToBoardVO> toBoardList(ToBoardVO tovo) {
		System.out.println("ToBoardDaoImpl.toBoardList SUCCESS >>> : ");
		
		return getSqlSession().selectList(PACKAGE_PATH + "toBoardList");
	}//End of toBoardList method block
}//End of ToBoardDaoImpl class block
