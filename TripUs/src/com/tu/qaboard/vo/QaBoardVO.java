package com.tu.qaboard.vo;

/**
FileName (���ϸ�): QaBoardVO.java
Explanation (����): QaBoardVO page
Date Written (�ۼ���): 2019.9.20
Writer (�ۼ���): YJH
*/

public class QaBoardVO {
	//field
	private String qano;                   //Post Number(�Խñ� ��ȣ)
	private String qaid;                   //Post ID(�Խñ� �ۼ���)
	private String qatitle;	               //Post Title(�Խñ� ����)
	private String qacontent;	           //Post Content(�Խñ� ����)   
	private String qatype;	               //Post Type(�Խñ� ���� Ÿ��)
	private String qaanswertype;           //Post Answer Type(�Խñ� ��� Ÿ��) 
	private String qasecretyn;             //Post secretYN(�Խñ� ��б� ����)
	private String qaimage;	               //Post Upload Image(�Խñ� ���ε� �̹���)   
	private String qaref;                  //Post Ref(�Խñ� ���� ����)
	private int    qastep;                 //Post Step(�Խñ� �亯 ����)
	private String qainsertdate;	       //Post Insertdate(�Խñ� �Է���)
	private String qaupdatedate;	       //Post Updatedate(�Խñ� ������)
	private String qadeleteyn;             //Post DeleteYN(�Խñ� ��������)
	private String qarecordinsertdate;	   //Post Record Insertdate(�Խñ� ���� �Է���)
	private String qarecordupdatedate;     //Post Record Updatedate(�Խñ� ���� ������)

	//search field
	private String qasearchcondition;      //search <select>(�˻� select ���)
	private String qasearchkeyword;        //search keyword(�˻� Ű���� ���)
	
	//reply field
	private String qareplycontent;         //Reply Content(�Խñ� �亯 ����) 
	
	//upload field
	private String qarealfilename;  	   //Upload File Name(�Խñ� ���ε� �̹�����)
	
	//paging field
	public int pageno;                     //paging number(������ ��ȣ)
	public int totalcount;                 //paging total page(�� �Խñ� ��)
	
	//constructor
	public QaBoardVO() {
	}//End of QaBoardVO constructor block

	public QaBoardVO(String qano, String qaid, String qatitle,
			String qacontent, String qatype, String qaanswertype,
			String qasecretyn, String qaimage, String qaref, int qastep,
			String qainsertdate, String qaupdatedate, String qadeleteyn,
			String qarecordinsertdate, String qarecordupdatedate,
			String qasearchcondition, String qasearchkeyword,
			String qareplycontent, String qarealfilename, int pageno,
			int totalcount) {
		this.qano = qano;
		this.qaid = qaid;
		this.qatitle = qatitle;
		this.qacontent = qacontent;
		this.qatype = qatype;
		this.qaanswertype = qaanswertype;
		this.qasecretyn = qasecretyn;
		this.qaimage = qaimage;
		this.qaref = qaref;
		this.qastep = qastep;
		this.qainsertdate = qainsertdate;
		this.qaupdatedate = qaupdatedate;
		this.qadeleteyn = qadeleteyn;
		this.qarecordinsertdate = qarecordinsertdate;
		this.qarecordupdatedate = qarecordupdatedate;
		this.qasearchcondition = qasearchcondition;
		this.qasearchkeyword = qasearchkeyword;
		this.qareplycontent = qareplycontent;
		this.qarealfilename = qarealfilename;
		this.pageno = pageno;
		this.totalcount = totalcount;
	}//End of QaBoardVO(parameter) constructor block

	//get&set method
	public String getQano() {
		return qano;
	}

	public void setQano(String qano) {
		this.qano = qano;
	}

	public String getQaid() {
		return qaid;
	}

	public void setQaid(String qaid) {
		this.qaid = qaid;
	}

	public String getQatitle() {
		return qatitle;
	}

	public void setQatitle(String qatitle) {
		this.qatitle = qatitle;
	}

	public String getQacontent() {
		return qacontent;
	}

	public void setQacontent(String qacontent) {
		this.qacontent = qacontent;
	}

	public String getQatype() {
		return qatype;
	}

	public void setQatype(String qatype) {
		this.qatype = qatype;
	}

	public String getQaanswertype() {
		return qaanswertype;
	}

	public void setQaanswertype(String qaanswertype) {
		this.qaanswertype = qaanswertype;
	}

	public String getQasecretyn() {
		return qasecretyn;
	}

	public void setQasecretyn(String qasecretyn) {
		this.qasecretyn = qasecretyn;
	}

	public String getQaimage() {
		return qaimage;
	}

	public void setQaimage(String qaimage) {
		this.qaimage = qaimage;
	}

	public String getQaref() {
		return qaref;
	}

	public void setQaref(String qaref) {
		this.qaref = qaref;
	}

	public int getQastep() {
		return qastep;
	}

	public void setQastep(int qastep) {
		this.qastep = qastep;
	}

	public String getQainsertdate() {
		return qainsertdate;
	}

	public void setQainsertdate(String qainsertdate) {
		this.qainsertdate = qainsertdate;
	}

	public String getQaupdatedate() {
		return qaupdatedate;
	}

	public void setQaupdatedate(String qaupdatedate) {
		this.qaupdatedate = qaupdatedate;
	}

	public String getQadeleteyn() {
		return qadeleteyn;
	}

	public void setQadeleteyn(String qadeleteyn) {
		this.qadeleteyn = qadeleteyn;
	}

	public String getQarecordinsertdate() {
		return qarecordinsertdate;
	}

	public void setQarecordinsertdate(String qarecordinsertdate) {
		this.qarecordinsertdate = qarecordinsertdate;
	}

	public String getQarecordupdatedate() {
		return qarecordupdatedate;
	}

	public void setQarecordupdatedate(String qarecordupdatedate) {
		this.qarecordupdatedate = qarecordupdatedate;
	}

	//search get&set method
	public String getQasearchcondition() {
		return qasearchcondition;
	}

	public void setQasearchcondition(String qasearchcondition) {
		this.qasearchcondition = qasearchcondition;
	}

	public String getQasearchkeyword() {
		return qasearchkeyword;
	}

	public void setQasearchkeyword(String qasearchkeyword) {
		this.qasearchkeyword = qasearchkeyword;
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
	
	//reply get&set method
	public String getQareplycontent() {
		return qareplycontent;
	}

	public void setQareplycontent(String qareplycontent) {
		this.qareplycontent = qareplycontent;
	}
	
	//upload get&set method
	public String getQarealfilename() {
		return qarealfilename;
	}

	public void setQarealfilename(String qarealfilename) {
		this.qarealfilename = qarealfilename;
	}
	
	//toString()
	@Override
	public String toString() {
		return "QaBoardVO [qano=" + qano + ", qaid=" + qaid + ", qatitle="
				+ qatitle + ", qacontent=" + qacontent + ", qatype=" + qatype
				+ ", qaanswertype=" + qaanswertype + ", qasecretyn="
				+ qasecretyn + ", qaimage=" + qaimage + ", qaref=" + qaref
				+ ", qastep=" + qastep + ", qainsertdate=" + qainsertdate
				+ ", qaupdatedate=" + qaupdatedate + ", qadeleteyn="
				+ qadeleteyn + ", qarecordinsertdate=" + qarecordinsertdate
				+ ", qarecordupdatedate=" + qarecordupdatedate
				+ ", qasearchcondition=" + qasearchcondition
				+ ", qasearchkeyword=" + qasearchkeyword + ", qareplycontent="
				+ qareplycontent + ", qarealfilename=" + qarealfilename
				+ ", pageno=" + pageno + ", totalcount=" + totalcount + "]";
	}//End of toString block
}//End of QaBoardVO class block