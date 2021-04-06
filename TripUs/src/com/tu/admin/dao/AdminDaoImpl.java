package com.tu.admin.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.tu.admin.vo.AdHistoryBoardVo;
import com.tu.admin.vo.AdminVo;

public class AdminDaoImpl extends SqlSessionDaoSupport implements AdminDao {

	//constructor field
	private final String PAKAGE_PATH = "mybatis.query.AdminMapper";
	
	@Override
	public List<AdminVo> adlistMember(AdminVo adminvo) {
		System.out.println("AdminDaoImpl adlistMember SUCCESS >>> : ");
		System.out.println("AdminDaoImpl adlistMember param >>>\n"+ adminvo);
		return getSqlSession().selectList(PAKAGE_PATH + "adlistMember");
	}

	@Override
	public List<AdHistoryBoardVo> adhistoryBoardList(AdHistoryBoardVo adhistoryvo) {
		System.out.println("AdminDaoImpl adhistoryBoardList SUCCESS >>> : ");
		System.out.println("AdminDaoImpl adhistoryBoardList param >>>\n"+ adhistoryvo);
		return getSqlSession().selectList(PAKAGE_PATH + "adhistoryBoardList");
	}


	@Override
	public int adhistoryBoardInsert(AdHistoryBoardVo adhistoryvo) {
		System.out.println("AdminDaoImpl adhistoryBoardInsert SUCCESS >>> : ");
		System.out.println("AdminDaoImpl adhistoryBoardInsert param >>>\n"+ adhistoryvo);
		return getSqlSession().insert(PAKAGE_PATH + "adhistoryBoardInsert");
	}

	@Override
	public AdHistoryBoardVo adhistoryBoardDetail(AdHistoryBoardVo adhistoryvo) {
		System.out.println("AdminDaoImpl adhistoryBoardDetail SUCCESS >>> : ");
		System.out.println("AdminDaoImpl adhistoryBoardDetail param >>>\n"+ adhistoryvo);
		return getSqlSession().selectOne(PAKAGE_PATH + "adhistoryBoardDetail");
	}

	@Override
	public int adhistoryBoardUpdate(AdHistoryBoardVo adhistoryvo) {
		System.out.println("AdminDaoImpl adhistoryBoardUpdate SUCCESS >>> : ");
		System.out.println("AdminDaoImpl adhistoryBoardUpdate param >>>\n"+ adhistoryvo);
		return getSqlSession().update(PAKAGE_PATH + "adhistoryBoardUpdate");
	}

	@Override
	public int adhistoryBoardDelete(AdHistoryBoardVo adhistoryvo) {
		System.out.println("AdminDaoImpl adhistoryBoardDelete SUCCESS >>> : ");
		System.out.println("AdminDaoImpl adhistoryBoardDelete param >>>\n"+ adhistoryvo);
		return getSqlSession().delete(PAKAGE_PATH + "adhistoryBoardDelete");
	}

	@Override
	public List adhistoryBoardListCount(Map map) {
		System.out.println("AdminDaoImpl adhistoryBoardListCount SUCCESS >>> : ");
		System.out.println("AdminDaoImpl adhistoryBoardListCount param >>>\n"+ map);
		return  getSqlSession().selectList(PAKAGE_PATH + "adhistoryBoardListCount");
	}

	@Override
	public List adlistMemberCount(Map map) {
		System.out.println("AdminDaoImpl adlistMemberCount SUCCESS >>> : ");
		System.out.println("AdminDaoImpl adlistMemberCount param >>>\n"+ map);
		return  getSqlSession().selectList(PAKAGE_PATH + "adlistMemberCount");
	}


}
