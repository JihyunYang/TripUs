package com.tu.comment.service;

/**
FileName (파일명): CommentService.java
Explanation (설명): CommentService page
Date Written (작성일): 2019.9.20
Writer (작성자): YJH
*/

import java.util.List;
import com.tu.comment.vo.CommentVO;
 
public interface CommentService {
	List<CommentVO> toCommentList(String contentid);
	public int toCommentInsert(CommentVO commentVo);
	public int toCommentUpdate(CommentVO commentVo);
	public int toCommentDelete(String commentno);
}//End of CommentService interface block
 
