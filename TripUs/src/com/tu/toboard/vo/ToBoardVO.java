package com.tu.toboard.vo;

/**
FileName (���ϸ�): ToBoardVO.java
Explanation (����): ToBoardVO page
Date Written (�ۼ���): 2019.9.20
Writer (�ۼ���): YJH
*/

public class ToBoardVO {
	//field
	private String viewno;         //View Number(�Խñ� ��ȣ)
	private String contentid;      //Content ID(API �Խù� ID)
	private String viewname;       //View Name(�Խñ� �̸�)
	
	//paging field
	public int pageno;                   //paging number(������ ��ȣ)
	public int totalcount;               //paging total page(�� �Խñ� ��)
	
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
