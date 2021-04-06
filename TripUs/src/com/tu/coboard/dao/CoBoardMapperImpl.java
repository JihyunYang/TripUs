package com.tu.coboard.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.tu.coboard.dao.CoBoardMapper;
import com.tu.coboard.vo.CoBoardVO;

public class CoBoardMapperImpl extends SqlSessionDaoSupport implements CoBoardMapper{
 
	private final String PACKAGE_PATH = "mybatis.query.CoBoardDAO";
	
	//Recommended Course Main Page
	@Override
	public List<CoBoardVO> coRecommendMainBoard(CoBoardVO cvo) {
		System.out.println("CoBoardMapperImpl.coRecommendMainBoard SUCCESS >>> : ");
		
		return getSqlSession().selectList(PACKAGE_PATH + "coRecommendMainBoard");
	}//end of recommendMainBoard method block
	
	@Override
	public List<CoBoardVO> selectContentID(CoBoardVO cvo){
		return getSqlSession().selectOne(PACKAGE_PATH+"selectContentID");
	}
	@Override
	public List<CoBoardVO> coBoardList(CoBoardVO cvo){
		return getSqlSession().selectList(PACKAGE_PATH+"coBoardList");
	}
	
}
