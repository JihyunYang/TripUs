package com.tu.comment.dao;

/**
FileName (파일명): CommentDao.java
Explanation (설명): CommentDao page
Date Written (작성일): 2019.9.20
Writer (작성자): YJH
*/

import java.util.List;
import com.tu.comment.vo.CommentVO;

public interface CommentDAO {
	List<CommentVO> toCommentList(String contentid);
	public int toCommentInsert(CommentVO commentVo);
	public int toCommentUpdate(CommentVO commentVo);
	public int toCommentDelete(String commentno);
}//End of CommentDao interface block 
