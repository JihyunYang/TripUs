package com.tu.comment.dao;

/**
FileName (���ϸ�): CommentDaoImpl.java
Explanation (����): CommentDaoImpl page
Date Written (�ۼ���): 2019.9.20
Writer (�ۼ���): YJH
*/

import java.util.List;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import com.tu.comment.vo.CommentVO;

public class CommentDAOImpl extends SqlSessionDaoSupport implements CommentDAO {
	
	//constructor field
	private final String PAKAGE_PATH = "mybatis.query.CommentMapper";

	//tour comment List
	@Override
	public List<CommentVO> toCommentList(String contentid) {
		System.out.println("CommentDaoImpl.toCommentList SUCCESS >>> : ");
		
		return getSqlSession().selectList(PAKAGE_PATH + "toCommentList");
	}//End of toCommentList method block
	
	//tour comment Insert 
	@Override
	public int toCommentInsert(CommentVO commentVo) {
		System.out.println("CommentDaoImpl.toCommentInsert SUCCESS >>> : ");
		
		return (int)getSqlSession().insert(PAKAGE_PATH + "toCommentInsert");
	}//End of toCommentInsert method block
	
	//tour comment Update
	@Override
	public int toCommentUpdate(CommentVO commentVo) {
		System.out.println("CommentDaoImpl.toCommentUpdate SUCCESS >>> : ");
		
		return (int)getSqlSession().update(PAKAGE_PATH + "toCommentUpdate"); 
	}//End of toCommentUpdate method block
	
	//tour comment Delete
	@Override
	public int toCommentDelete(String commentno) {
		System.out.println("CommentDaoImpl.toCommentDelete SUCCESS >>> : ");
		
		return (int)getSqlSession().delete(PAKAGE_PATH + "toCommentDelete");
	}//End of toCommentDelete method block
}//End of CommentDaoImpl class block
