package com.tu.ntboard.dao;

/**
FileName (���ϸ�): NtBoardDAOImpl.java
Explanation (����): NtBoardDAOImpl page
Date Written (�ۼ���): 2019.9.20
Writer (�ۼ���): YJH
*/

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.tu.ntboard.vo.NtBoardVO;

public class NtBoardDAOImpl extends SqlSessionDaoSupport implements NtBoardDAO {

	//constructor field
	private final String PAKAGE_PATH = "mybatis.query.NtBoardMapper";
	
	//Notice Main Page
	@Override
	public List<NtBoardVO> ntBoardList(NtBoardVO ntvo) {
		System.out.println("NtBoardDAOImpl.ntBoardList SUCCESS >>> : ");
		
		return getSqlSession().selectList(PAKAGE_PATH + "ntBoardList");
	}//End of ntBoardList method block
	
	//Notice Insert Page
	@Override
	public int ntBoardInsert(NtBoardVO ntvo) {
		System.out.println("NtBoardDAOImpl.ntBoardInsert SUCCESS >>> : ");
		
		return (int)getSqlSession().insert(PAKAGE_PATH + "ntBoardInsert");
	}//End of ntBoardInsert method block

	//Notice Detail Page
	@Override
	public NtBoardVO ntBoardDetail(NtBoardVO ntvo) {
		System.out.println("NtBoardDAOImpl.ntBoardDetail SUCCESS >>> : ");
		
		return (NtBoardVO)getSqlSession().selectOne(PAKAGE_PATH + "ntBoardDetail");
	}//End of ntBoardDetail method block
	
	//Notice Update Page
	@Override
	public int ntBoardUpdate(NtBoardVO ntvo) {
		System.out.println("NtBoardDAOImpl.ntBoardUpdate SUCCESS >>> : ");
		
		return (int)getSqlSession().update(PAKAGE_PATH + "ntBoardUpdate");
	}//End of ntBoardUpdate method block
	
	//Notice Delete Page
	@Override
	public int ntBoardDelete(NtBoardVO ntvo) {
		System.out.println("NtBoardDAOImpl.ntBoardDelete SUCCESS >>> : ");
		
		return (int)getSqlSession().delete(PAKAGE_PATH + "ntBoardDelete");
	}//End of ntBoardDelete method block
	
	//Hit Count (��ȸ�� ���ϴ� �޼���)
	@Override
	public int ntUpdateViewCnt(NtBoardVO ntvo) {
		System.out.println("NtBoardDAOImpl.ntUpdateViewCnt SUCCESS >>> : ");
			
		return (int)getSqlSession().update(PAKAGE_PATH + "ntUpdateViewCnt");
	}//End of ntUpdateViewCnt method block
	
	
	//Get the Total Number of Posts (��ü �Խñ� �� ���ϴ� �޼���)
	@Override
	public int ntBoardListCnt(NtBoardVO ntvo) {
		System.out.println("NtBoardDAOImpl.ntBoardListCnt SUCCESS >>> : ");
		
		return (int)getSqlSession().selectOne(PAKAGE_PATH + "ntBoardListCnt");
	}//End of ntBoardListCnt method block

	//Paging (����¡ ���ϴ� �޼���)
	@Override
	public List ntBoardListCount(Map map) {
		System.out.println("NtBoardDAOImpl.ntBoardListCount SUCCESS >>> : ");
		
		return getSqlSession().selectList(PAKAGE_PATH + "ntBoardListCount");
	}//End of ntBoardListCount method block
}//End of NtBoardDAOImpl class block
