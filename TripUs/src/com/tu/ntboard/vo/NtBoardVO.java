package com.tu.ntboard.vo;

/**
FileName (���ϸ�): NtBoardVo.java
Explanation (����): NtBoardVo page
Date Written (�ۼ���): 2019.9.20
Writer (�ۼ���): YJH
*/

public class NtBoardVO {
	//field
	private String ntno;                  //Post Number(�Խñ� ��ȣ)
	private String ntid;                  //Post ID(�Խñ� �ۼ���)
	private String nttitle;               //Post Title(�Խñ� ����)
	private String ntcontent;             //Post Content(�Խñ� ����)
	private String nthit;                 //Post Hit(�Խñ� ��ȸ��)
	private String ntinsertdate;          //Post Insertdate(�Խñ� �Է���)
	private String ntupdatedate;          //Post Updatedate(�Խñ� ������)
	private String ntdeleteyn;            //Post DeleteYN(�Խñ� ��������)
	private String ntrecordinsertdate;    //Post Record Insertdate(�Խñ� ���� �Է���)
	private String ntrecordupdatedate;    //Post Record Updatedate(�Խñ� ���� ������)
	
	//search field
	private String ntsearchcondition;     //search <select>(�˻� select ���)
	private String ntsearchkeyword;       //search keyword(�˻� Ű���� ���)
	
	//paging field
	public int pageno;                    //paging number(������ ��ȣ)
	public int totalcount;                //paging total page(�� �Խñ� ��)
	
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
