package com.tu.comment.vo;

/**
FileName (파일명): CommentVO.java
Explanation (설명): CommentVO page
Date Written (작성일): 2019.9.20
Writer (작성자): YJH
*/

public class CommentVO {
 
	//field
    private String commentno;                  //Comment number(댓글 번호) 
    private String contentid;                  //Content ID(API 게시물 ID)
    private String commentid;                  //Comment ID(작성자 ID)
    private String commentnick;                //Comment Nick(작성자 닉네임)
    private String commentprofile;             //Comment Profile(작성자 프로필)
    private String commentcontent;             //Comment Content(댓글 내용)
    private String commentinsertdate;          //Comment Insertdate(댓글 작성일)
    private String commentupdatedate;          //Comment Updatedate(댓글 수정일)
    private String commentdeleteyn;            //Comment DeleteYN(댓글 삭제여부)
    private String commentrecordinsertdate;    //Comment Record Insertdate(댓글 생성 입력일)
    private String commentrecordupdatedate;    //Comment Record Updatedate(댓글 생성 수정일)
    
    //constructor
    public CommentVO() {
    }//End of CommentVO constructor block
    
	public CommentVO(String commentno, String contentid, String commentid, String commentnick,
			String commentprofile, String commentcontent, String commentinsertdate, String commentupdatedate,
			String commentdeleteyn, String commentrecordinsertdate, String commentrecordupdatedate) {
		this.commentno = commentno;
		this.contentid = contentid;
		this.commentid = commentid;
		this.commentnick = commentnick;
		this.commentprofile = commentprofile;
		this.commentcontent = commentcontent;
		this.commentinsertdate = commentinsertdate;
		this.commentupdatedate = commentupdatedate;
		this.commentdeleteyn = commentdeleteyn;
		this.commentrecordinsertdate = commentrecordinsertdate;
		this.commentrecordupdatedate = commentrecordupdatedate;
	}//End of CommentVO constructor block

	//get&set method
	public String getCommentno() {
		return commentno;
	}

	public void setCommentno(String commentno) {
		this.commentno = commentno;
	}

	public String getContentid() {
		return contentid;
	}

	public void setContentid(String contentid) {
		this.contentid = contentid;
	}

	public String getCommentid() {
		return commentid;
	}

	public void setCommentid(String commentid) {
		this.commentid = commentid;
	}

	public String getCommentnick() {
		return commentnick;
	}

	public void setCommentnick(String commentnick) {
		this.commentnick = commentnick;
	}

	public String getCommentprofile() {
		return commentprofile;
	}

	public void setCommentprofile(String commentprofile) {
		this.commentprofile = commentprofile;
	}

	public String getCommentcontent() {
		return commentcontent;
	}

	public void setCommentcontent(String commentcontent) {
		this.commentcontent = commentcontent;
	}

	public String getCommentinsertdate() {
		return commentinsertdate;
	}

	public void setCommentinsertdate(String commentinsertdate) {
		this.commentinsertdate = commentinsertdate;
	}

	public String getCommentupdatedate() {
		return commentupdatedate;
	}

	public void setCommentupdatedate(String commentupdatedate) {
		this.commentupdatedate = commentupdatedate;
	}

	public String getCommentdeleteyn() {
		return commentdeleteyn;
	}

	public void setCommentdeleteyn(String commentdeleteyn) {
		this.commentdeleteyn = commentdeleteyn;
	}

	public String getCommentrecordinsertdate() {
		return commentrecordinsertdate;
	}

	public void setCommentrecordinsertdate(String commentrecordinsertdate) {
		this.commentrecordinsertdate = commentrecordinsertdate;
	}

	public String getCommentrecordupdatedate() {
		return commentrecordupdatedate;
	}

	public void setCommentrecordupdatedate(String commentrecordupdatedate) {
		this.commentrecordupdatedate = commentrecordupdatedate;
	}

	//toString()
	@Override
	public String toString() {
		return "CommentVO [commentno=" + commentno + ", contentid=" + contentid
							+ ", commentid=" + commentid + ", commentnick=" + commentnick + ", commentprofile=" + commentprofile
							+ ", commentcontent=" + commentcontent + ", commentinsertdate=" + commentinsertdate
							+ ", commentupdatedate=" + commentupdatedate + ", commentdeleteyn=" + commentdeleteyn
							+ ", commentrecordinsertdate=" + commentrecordinsertdate + ", commentrecordupdatedate="
							+ commentrecordupdatedate + "]";
	}//End of toString block
}//End of CommentVO block


