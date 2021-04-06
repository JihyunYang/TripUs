package com.tu.qaboard.vo;

/**
FileName (파일명): QaBoardVO.java
Explanation (설명): QaBoardVO page
Date Written (작성일): 2019.9.20
Writer (작성자): YJH
*/

public class QaBoardVO {
	//field
	private String qano;                   //Post Number(게시글 번호)
	private String qaid;                   //Post ID(게시글 작성자)
	private String qatitle;	               //Post Title(게시글 제목)
	private String qacontent;	           //Post Content(게시글 내용)   
	private String qatype;	               //Post Type(게시글 문의 타입)
	private String qaanswertype;           //Post Answer Type(게시글 답글 타입) 
	private String qasecretyn;             //Post secretYN(게시글 비밀글 여부)
	private String qaimage;	               //Post Upload Image(게시글 업로드 이미지)   
	private String qaref;                  //Post Ref(게시글 고정 계층)
	private int    qastep;                 //Post Step(게시글 답변 계층)
	private String qainsertdate;	       //Post Insertdate(게시글 입력일)
	private String qaupdatedate;	       //Post Updatedate(게시글 수정일)
	private String qadeleteyn;             //Post DeleteYN(게시글 삭제여부)
	private String qarecordinsertdate;	   //Post Record Insertdate(게시글 생성 입력일)
	private String qarecordupdatedate;     //Post Record Updatedate(게시글 생성 수정일)

	//search field
	private String qasearchcondition;      //search <select>(검색 select 목록)
	private String qasearchkeyword;        //search keyword(검색 키워드 목록)
	
	//reply field
	private String qareplycontent;         //Reply Content(게시글 답변 내용) 
	
	//upload field
	private String qarealfilename;  	   //Upload File Name(게시글 업로드 이미지명)
	
	//paging field
	public int pageno;                     //paging number(페이지 번호)
	public int totalcount;                 //paging total page(총 게시글 수)
	
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