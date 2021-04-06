package com.tu.toboard.vo;

/**
FileName (파일명): ToBoardVO.java
Explanation (설명): ToBoardVO page
Date Written (작성일): 2019.9.20
Writer (작성자): YJH
*/

public class ToBoardVO {
	//field
	private String viewno;         //View Number(게시글 번호)
	private String contentid;      //Content ID(API 게시물 ID)
	private String viewname;       //View Name(게시글 이름)
	
	//paging field
	public int pageno;                   //paging number(페이지 번호)
	public int totalcount;               //paging total page(총 게시글 수)
	
	//constructor
	public ToBoardVO() {
	}//End of ToBoardVO constructor block
		
	public ToBoardVO(String viewno, String contentid, String viewname
					,int pageno, int totalcount) {
		this.viewno = viewno;
		this.contentid = contentid;
		this.viewname = viewname;
		this.pageno = pageno;
		this.totalcount = totalcount;
	}//End of ToBoardVO(parameter) constructor block

	//get&set method
	public String getViewno() {
		return viewno;
	}

	public void setViewno(String viewno) {
		this.viewno = viewno;
	}

	public String getContentid() {
		return contentid;
	}

	public void setContentid(String contentid) {
		this.contentid = contentid;
	}

	public String getViewname() {
		return viewname;
	}

	public void setViewname(String viewname) {
		this.viewname = viewname;
	}
	
	//paging get&set method
	public int getPageno() {
		return pageno;
	}

	public void setPageno(int pageno) {
		this.pageno = pageno;
	}

	public int getTotalcount() {
		return totalcount;
	}

	public void setTotalcount(int totalcount) {
		this.totalcount = totalcount;
	}
	
	//toString()
	@Override
	public String toString() {
		return "ToBoardVO [viewno=" + viewno + ", contentid=" + contentid + ", viewname=" + viewname + ", pageno="
				+ pageno + ", totalcount=" + totalcount + "]";
	}//End of toString block
}//End of ToBoardVO class block
