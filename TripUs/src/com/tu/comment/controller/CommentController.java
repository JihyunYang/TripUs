package com.tu.comment.controller;

/**
FileName (파일명): CommentController.java
Explanation (설명): CommentController page
Date Written (작성일): 2019.9.20
Writer (작성자): YJH
*/

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tu.comment.service.CommentService;
import com.tu.comment.vo.CommentVO;

@Controller
@RequestMapping("/comment")
public class CommentController {
	
	//constructor field
	private static final String CONTEXT_PATH = "comment";
	
	@Autowired
	private CommentService commentService;
 
    //Tour Comment List
    @RequestMapping(value = "/toCommentList", produces = "application/json; charset=UTF-8")
    @ResponseBody
    public List<CommentVO>  toCommentList(@RequestParam("contentid") String contentid) {
    	System.out.println("CommentController.toCommentList SUCCESS >>> : ");
    	System.out.println("CommentController.toCommentList commentVo.getContentid() >>> : " + contentid);

    	/*
    	This is the controller code when sending to VO (만약 VO로 보낼경우의 컨트롤러 코드이다.)
	   	
	   	public List<CommentVO> toCommentList(@ModelandView CommentVO commentVo) {
	    	return commentService.toCommentList(commentVo);
	    }
    	*/
    		return commentService.toCommentList(contentid);
    }// End of toCommentList method block
    
    //Tour Comment Insert 
    @RequestMapping(value = "/toCommentInsert", produces = "application/json; charset=UTF-8")
    @ResponseBody
    //content is the name on the form in toBoardDetail.jsp
    public int toCommentInsert(@RequestParam("commentid") String commentId, @RequestParam("commentnick") String commentNick,
    						   @RequestParam("commentcontent") String commentContent, @RequestParam("contentid") String contentId,
    						   HttpSession session)  {
    	System.out.println("CommentController.toCommentInsert SUCCESS >>> : ");
    	System.out.println("CommentController.toCommentInsert.commentId confirm >>> : " + commentId);
    	System.out.println("CommentController.toCommentInsert.commentNick confirm >>> : " + commentNick);
    	System.out.println("CommentController.toCommentInsert.commentContent confirm >>> : " + commentContent);
    	System.out.println("CommentController.toCommentInsert.contentId confirm >>> : " + contentId);
    	
    	CommentVO commentVo = new CommentVO();
    	commentVo.setCommentid(commentId);
    	commentVo.setCommentnick(commentNick);
    	commentVo.setCommentcontent(commentContent);
    	commentVo.setContentid(contentId);
    		
		return commentService.toCommentInsert(commentVo);
    }// End of toCommentInsert method block
 
    //Tour Comment Update
    @RequestMapping(value = "/toCommentUpdate", produces = "application/json; charset=UTF-8")
    @ResponseBody
    public int toCommentUpdate(@RequestParam("commentno") String commentNo, @RequestParam("commentcontent") String commentContent){
    	System.out.println("CommentController.toCommentUpdate SUCCESS >>> : ");
    	System.out.println("CommentController.toCommentUpdate commentNo confirm >>> : " + commentNo);
    	System.out.println("CommentController.toCommentUpdate commentContent confirm >>> : " + commentContent);
    	
    	CommentVO commentVo = new CommentVO();
    	commentVo.setCommentno(commentNo);
    	commentVo.setCommentcontent(commentContent);
    	
    	return commentService.toCommentUpdate(commentVo);
    }//End of toCommentUpdate method block
    
    //Tour Comment Delete
    @RequestMapping(value = "/toCommentDelete", produces = "application/json; charset=UTF-8")
    @ResponseBody
    public int toCommentDelete(@RequestParam("commentno") String commentNo){
    	System.out.println("CommentController.toCommentDelete SUCCESS >>> : ");
    	System.out.println("CommentController.toCommentDelete commentNo confirm >>> : " + commentNo);
    	
    	return commentService.toCommentDelete(commentNo);
    }//End of toCommentDelete method block
}//End of CommentController class 


