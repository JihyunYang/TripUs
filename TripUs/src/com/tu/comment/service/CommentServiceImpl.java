package com.tu.comment.service;

/**
FileName (파일명): CommentServiceImpl.java
Explanation (설명): CommentServiceImpl page
Date Written (작성일): 2019.9.20
Writer (작성자): YJH
*/

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.tu.comment.dao.CommentDAO;
import com.tu.comment.vo.CommentVO;

@Service
@Transactional 
public class CommentServiceImpl implements CommentService {
	
	@Autowired 
	private CommentDAO commentDao;
	
	//tour comment List
	@Override
	public List<CommentVO> toCommentList(String contentid) {
		System.out.println("CommentServiceImpl.toCommentList SUCCESS >>> : ");
		
		List<CommentVO> tocmList = new ArrayList<CommentVO>();
		tocmList = commentDao.toCommentList(contentid);
			System.out.println("CommentServiceImpl.toCommentList tocmList confirm >>> : " + tocmList);
		
		return tocmList;
	}//End of toCommentList method block
	
	//tour comment Insert 
	@Override
	public int toCommentInsert(CommentVO commentVo) {
		System.out.println("CommentServiceImpl.toCommentInsert SUCCESS >>> : ");
		
		return commentDao.toCommentInsert(commentVo);
	}//End of toCommentInsert method block
	
	//tour comment Update
	@Override
	public int toCommentUpdate(CommentVO commentVo) {
		System.out.println("CommentServiceImpl.toCommentUpdate SUCCESS >>> : ");
		
		return commentDao.toCommentUpdate(commentVo);
	}//End of toCommentUpdate method block
	
	//tour comment Delete
	@Override
	public int toCommentDelete(String commentno) {
		System.out.println("CommentServiceImpl.toCommentDelete SUCCESS >>> : ");
		
		return commentDao.toCommentDelete(commentno);
	}//End of toCommentDelete method block
}//End of CommentServiceImpl class block
