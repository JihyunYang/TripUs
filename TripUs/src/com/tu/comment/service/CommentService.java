package com.tu.comment.service;

/**
FileName (���ϸ�): CommentService.java
Explanation (����): CommentService page
Date Written (�ۼ���): 2019.9.20
Writer (�ۼ���): YJH
*/

import java.util.List;
import com.tu.comment.vo.CommentVO;
 
public interface CommentService {
	List<CommentVO> toCommentList(String contentid);
	public int toCommentInsert(CommentVO commentVo);
	public int toCommentUpdate(CommentVO commentVo);
	public int toCommentDelete(String commentno);
}//End of CommentService interface block
 
