package com.tu.ntboard.vo;

/**
FileName (파일명): NtBoardVo.java
Explanation (설명): NtBoardVo page
Date Written (작성일): 2019.9.20
Writer (작성자): YJH
*/

public class NtBoardVO {
	//field
	private String ntno;                  //Post Number(게시글 번호)
	private String ntid;                  //Post ID(게시글 작성자)
	private String nttitle;               //Post Title(게시글 제목)
	private String ntcontent;             //Post Content(게시글 내용)
	private String nthit;                 //Post Hit(게시글 조회수)
	private String ntinsertdate;          //Post Insertdate(게시글 입력일)
	private String ntupdatedate;          //Post Updatedate(게시글 수정일)
	private String ntdeleteyn;            //Post DeleteYN(게시글 삭제여부)
	private String ntrecordinsertdate;    //Post Record Insertdate(게시글 생성 입력일)
	private String ntrecordupdatedate;    //Post Record Updatedate(게시글 생성 수정일)
	
	//search field
	private String ntsearchcondition;     //search <select>(검색 select 목록)
	private String ntsearchkeyword;       //search keyword(검색 키워드 목록)
	
	//paging field
	public int pageno;                    //paging number(페이지 번호)
	public int totalcount;                //paging total page(총 게시글 수)
	
	//constructor
	public NtBoardVO() {
	}//End of NtBoardVO constructor block

	public NtBoardVO(String ntno, String ntid, String nttitle,
					 String ntcontent, String nthit, String ntinsertdate,
					 String ntupdatedate, String ntdeleteyn, String ntrecordinsertdate,
					 String ntrecordupdatedate, String ntsearchcondition,
					 String ntsearchkeyword, int pageno, int totalcount) {
		this.ntno = ntno;
		this.ntid = ntid;
		this.nttitle = nttitle;
		this.ntcontent = ntcontent;
		this.nthit = nthit;
		this.ntinsertdate = ntinsertdate;
		this.ntupdatedate = ntupdatedate;
		this.ntdeleteyn = ntdeleteyn;
		this.ntrecordinsertdate = ntrecordinsertdate;
		this.ntrecordupdatedate = ntrecordupdatedate;
		this.ntsearchcondition = ntsearchcondition;
		this.ntsearchkeyword = ntsearchkeyword;
		this.pageno = pageno;
		this.totalcount = totalcount;
	}//End of NtBoardVO(parameter) constructor block

	//get&set method
	public String getNtno() {
		return ntno;
	}

	public void setNtno(String ntno) {
		this.ntno = ntno;
	}
	
	public String getNtid() {
		return ntid;
	}

	public void setNtid(String ntid) {
		this.ntid = ntid;
	}

	public String getNttitle() {
		return nttitle;
	}

	public void setNttitle(String nttitle) {
		this.nttitle = nttitle;
	}

	public String getNtcontent() {
		return ntcontent;
	}

	public void setNtcontent(String ntcontent) {
		this.ntcontent = ntcontent;
	}

	public String getNthit() {
		return nthit;
	}

	public void setNthit(String nthit) {
		this.nthit = nthit;
	}

	public String getNtinsertdate() {
		return ntinsertdate;
	}

	public void setNtinsertdate(String ntinsertdate) {
		this.ntinsertdate = ntinsertdate;
	}

	public String getNtupdatedate() {
		return ntupdatedate;
	}

	public void setNtupdatedate(String ntupdatedate) {
		this.ntupdatedate = ntupdatedate;
	}

	public String getNtdeleteyn() {
		return ntdeleteyn;
	}

	public void setNtdeleteyn(String ntdeleteyn) {
		this.ntdeleteyn = ntdeleteyn;
	}

	public String getNtrecordinsertdate() {
		return ntrecordinsertdate;
	}

	public void setNtrecordinsertdate(String ntrecordinsertdate) {
		this.ntrecordinsertdate = ntrecordinsertdate;
	}

	public String getNtrecordupdatedate() {
		return ntrecordupdatedate;
	}

	public void setNtrecordupdatedate(String ntrecordupdatedate) {
		this.ntrecordupdatedate = ntrecordupdatedate;
	}

	//search get&set method
	public String getNtsearchcondition() {
		return ntsearchcondition;
	}

	public void setNtsearchcondition(String ntsearchcondition) {
		this.ntsearchcondition = ntsearchcondition;
	}

	public String getNtsearchkeyword() {
		return ntsearchkeyword;
	}

	public void setNtsearchkeyword(String ntsearchkeyword) {
		this.ntsearchkeyword = ntsearchkeyword;
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
		return "NtBoardVO [ntno=" + ntno + ", ntid=" + ntid + ", nttitle="
				+ nttitle + ", ntcontent=" + ntcontent + ", nthit=" + nthit
				+ ", ntinsertdate=" + ntinsertdate + ", ntupdatedate="
				+ ntupdatedate + ", ntdeleteyn=" + ntdeleteyn
				+ ", ntrecordinsertdate=" + ntrecordinsertdate
				+ ", ntrecordupdatedate=" + ntrecordupdatedate
				+ ", ntsearchcondition=" + ntsearchcondition
				+ ", ntsearchkeyword=" + ntsearchkeyword + ", pageno=" + pageno
				+ ", totalcount=" + totalcount + "]";
	}//End of toString block
}//End of NtBoardVO class block
