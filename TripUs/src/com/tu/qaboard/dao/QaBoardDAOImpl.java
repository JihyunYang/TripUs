package com.tu.qaboard.dao;

/**
FileName (���ϸ�): QaBoardDAOImpl.java
Explanation (����): QaBoardDAOImpl page
Date Written (�ۼ���): 2019.9.20
Writer (�ۼ���): YJH
*/

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.tu.qaboard.vo.QaBoardVO;

public class QaBoardDAOImpl extends SqlSessionDaoSupport implements QaBoardDAO {

	//constructor field
	private final String PAKAGE_PATH = "mybatis.query.QaBoardMapper";

	//QnA Main Page
	@Override
	public List<QaBoardVO> qaBoardList(QaBoardVO qavo) {
		System.out.println("QaBoardDaoImpl.qaBoardList SUCCESS >>> : ");
		
		return getSqlSession().selectList(PAKAGE_PATH + "qaBoardList");
	}//End of qaBoardList method block

	//QnA Insert Page 
	@Override
	public int qaBoardInsert(QaBoardVO qavo) {
		System.out.println("QaBoardDaoImpl.qaBoardInsert SUCCESS >>> : ");
		
		return getSqlSession().insert(PAKAGE_PATH + "qaBoardInsert");
	}//End of qaBoardInsert method block

	//QnA Detail Page
	@Override
	public QaBoardVO qaBoardDetail(QaBoardVO qavo) {
		System.out.println("QaBoardDaoImpl.qaBoardDetail SUCCESS >>> : ");
		
		return (QaBoardVO)getSqlSession().selectOne(PAKAGE_PATH + "qaBoardDetail");
	}//End of qaBoardDetail method block

	//QnA Update Page
	@Override
	public int qaBoardUpdate(QaBoardVO qavo) {
		System.out.println("QaBoardDaoImpl.qaBoardUpdate SUCCESS >>> : ");
		
		return getSqlSession().update(PAKAGE_PATH + "qaBoardUpdate");
	}//End of qaBoardUpdate method block

	//QnA Delete Page
	@Override
	public int qaBoardDelete(QaBoardVO qavo) {
		System.out.println("QaBoardDaoImpl.qaBoardDelete SUCCESS >>> : ");
		
		return getSqlSession().delete(PAKAGE_PATH + "qaBoardDelete");
	}//End of qaBoardDelete method block

	//Get the value of the selected qano (���õ� qano�� ���� ���ϴ� �޼���)
	@Override
	public String qaBoardQaNoSelect() {
		System.out.println("QaBoardDaoImpl.qaBoardQaNoSelect SUCCESS >>> : ");
		
		return getSqlSession().selectOne(PAKAGE_PATH + "qaBoardQaNoSelect");
	}//End of qaBoardQaNoSelect method block

	//paging (����¡ ���ϴ� �޼���)
	@Override
	public List qaBoardListCount(Map map) {
		System.out.println("QaBoardDaoImpl.qaBoardListCount SUCCESS >>> : ");
		
		return  getSqlSession().selectList(PAKAGE_PATH + "qaBoardListCount");
	}//End of qaBoardListCount method block
}//End of qaBoardList method block
