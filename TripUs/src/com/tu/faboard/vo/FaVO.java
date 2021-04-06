package com.tu.faboard.vo;

/**
FileName (파일명): FaVO.java
Explanation (설명): FaVO page
Date Written (작성일): 2019.9.20
Writer (작성자): YJH
*/

public class FaVO{
	//field
	private String fano;                //Post Number(게시글 번호)
	private String faid;                //Post ID(게시글 작성자)
	private String fatitle;             //Post Title(게시글 제목)
	private String facontent;           //Post Content(게시글 내용)
	private String fatype;              //Post Type(게시글 문의 타입)
	private String faaddsite;         	//Post SiteName(게시글 내 사이트주소)
	private String fainsertdate;        //Post Insertdate(게시글 입력일)
	private String faupdatedate;        //Post Updatedate(게시글 수정일)
	private String fadeleteyn;          //Post DeleteYN(게시글 삭제여부)
	private String farecordinsertdate;  //Post Record Insertdate(게시글 생성 입력일)
	private String farecordupdatedate;  //Post Record Updatedate(게시글 생성 수정일)
	
	//search field
	private String fasearchcondition;   //search <select>(검색 select 목록)
	private String fasearchkeyword;     //search keyword(검색 키워드 목록)
	
	//paging field
	public int pageno;                   //paging number(페이지 번호)
	public int totalcount;               //paging total page(총 게시글 수)
	
	//constructor
	public FaVO() {
	}//End of FaVO constructor block
	
	public FaVO(String fano, String faid, String fatitle, String facontent,
			String fatype, String faaddsite, String fainsertdate,
			String faupdatedate, String fadeleteyn, String farecordinsertdate,
			String farecordupdatedate, String fasearchcondition,
			String fasearchkeyword, int pageno, int totalcount) {
		this.fano = fano;
		this.faid = faid;
		this.fatitle = fatitle;
		this.facontent = facontent;
		this.fatype = fatype;
		this.faaddsite = faaddsite;
		this.fainsertdate = fainsertdate;
		this.faupdatedate = faupdatedate;
		this.fadeleteyn = fadeleteyn;
		this.farecordinsertdate = farecordinsertdate;
		this.farecordupdatedate = farecordupdatedate;
		this.fasearchcondition = fasearchcondition;
		this.fasearchkeyword = fasearchkeyword;
		this.pageno = pageno;
		this.totalcount = totalcount;
	}//End of FaVO(parameter) constructor block

	//get&set method
	public String getFano() {
		return fano;
	}
	
	public void setFano(String fano) {
		this.fano = fano;
	}

	public String getFaid() {
		return faid;
	}

	public void setFaid(String faid) {
		this.faid = faid;
	}

	public String getFatitle() {
		return fatitle;
	}

	public void setFatitle(String fatitle) {
		this.fatitle = fatitle;
	}

	public String getFacontent() {
		return facontent;
	}

	public void setFacontent(String facontent) {
		this.facontent = facontent;
	}

	public String getFatype() {
		return fatype;
	}

	public void setFatype(String fatype) {
		this.fatype = fatype;
	}
	
	public void setFaaddsite(String faaddsite) {
		this.faaddsite = faaddsite;
	}

	public String getFaaddsite() {
		return faaddsite;
	}

	public String getFainsertdate() {
		return fainsertdate;
	}

	public void setFainsertdate(String fainsertdate) {
		this.fainsertdate = fainsertdate;
	}

	public String getFaupdatedate() {
		return faupdatedate;
	}

	public void setFaupdatedate(String faupdatedate) {
		this.faupdatedate = faupdatedate;
	}

	public String getFadeleteyn() {
		return fadeleteyn;
	}

	public void setFadeleteyn(String fadeleteyn) {
		this.fadeleteyn = fadeleteyn;
	}

	public String getFarecordinsertdate() {
		return farecordinsertdate;
	}

	public void setFarecordinsertdate(String farecordinsertdate) {
		this.farecordinsertdate = farecordinsertdate;
	}

	public String getFarecordupdatedate() {
		return farecordupdatedate;
	}

	public void setFarecordupdatedate(String farecordupdatedate) {
		this.farecordupdatedate = farecordupdatedate;
	}
	
	//search get&set method
	public String getFasearchcondition() {
		return fasearchcondition;
	}

	public void setFasearchcondition(String fasearchcondition) {
		this.fasearchcondition = fasearchcondition;
	}

	public String getFasearchkeyword() {
		return fasearchkeyword;
	}

	public void setFasearchkeyword(String fasearchkeyword) {
		this.fasearchkeyword = fasearchkeyword;
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
		return "FaVo [fano=" + fano + ", faid=" + faid + ", fatitle=" + fatitle
				+ ", facontent=" + facontent + ", fatype=" + fatype
				+ ", faaddsite=" + faaddsite + ", fainsertdate=" + fainsertdate
				+ ", faupdatedate=" + faupdatedate + ", fadeleteyn="
				+ fadeleteyn + ", farecordinsertdate=" + farecordinsertdate
				+ ", farecordupdatedate=" + farecordupdatedate
				+ ", fasearchcondition=" + fasearchcondition
				+ ", fasearchkeyword=" + fasearchkeyword + ", pageno=" + pageno
				+ ", totalcount=" + totalcount + "]";
	}//End of toString block
}//End of FaVO class block