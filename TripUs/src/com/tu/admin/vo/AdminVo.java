package com.tu.admin.vo;

import com.tu.mem.vo.MemberVO;


public class AdminVo extends MemberVO{

	//adminvo search field
	private String adsearchcondition;     //search <select>
	private String adsearchkeyword;       //search keyword
	
	//paging field
	public int pageno;
	public int totalcount;
	
	// adminvo search field
	public String getAdsearchcondition() {
		return adsearchcondition;
	}
	public void setAdsearchcondition(String adsearchcondition) {
		this.adsearchcondition = adsearchcondition;
	}
	public String getAdsearchkeyword() {
		return adsearchkeyword;
	}
	public void setAdsearchkeyword(String adsearchkeyword) {
		this.adsearchkeyword = adsearchkeyword;
	}
	
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
	@Override
	public String toString() {
		return "AdminVo [adsearchcondition=" + adsearchcondition
				+ ", adsearchkeyword=" + adsearchkeyword + ", pageno=" + pageno
				+ ", totalcount=" + totalcount + "]";
	}

}
