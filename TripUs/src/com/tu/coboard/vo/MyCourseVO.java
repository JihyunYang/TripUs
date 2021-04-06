package com.tu.coboard.vo;

public class MyCourseVO {
	private String mcno;
	private String mcid;
	private String mcitem;
	private String mctitle;
	private String mccontentid;
	private String mcinsertdate;
	private String mcupdatedate;
	private String mcrecordinsertdate;
	private String mcrecordupdatedate;
	private String id;
	public MyCourseVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MyCourseVO(String mcno, String mcid, String mcitem, String mctitle,
			String mccontentid, String mcinsertdate, String mcupdatedate,
			 String mcrecordinsertdate, String mcrecordupdatedate, String id) {
		super();
		this.mcno = mcno;
		this.mcid = mcid;
		this.mcitem = mcitem;
		this.mctitle = mctitle;
		this.mccontentid = mccontentid;
		this.mcinsertdate = mcinsertdate;
		this.mcupdatedate = mcupdatedate;
		this.mcrecordinsertdate = mcrecordinsertdate;
		this.mcrecordupdatedate = mcrecordupdatedate;
		this.id = id;
	}
	
	@Override
	public String toString() {
		return "MyCourseVO [mcno=" + mcno + ", mcid=" + mcid + ", mcitem=" + mcitem + ", mctitle=" + mctitle + ", mccontentid=" + mccontentid + ", mcinsertdate=" + mcinsertdate
				+ ", mcupdatedate=" + mcupdatedate + ", mcrecordinsertdate=" + mcrecordinsertdate + ", mcrecordupdatedate=" + mcrecordupdatedate +"id="+id+"]";
	}
	

	public String getMcno() {
		return mcno;
	}

	public void setMcno(String mcno) {
		this.mcno = mcno;
	}

	public String getMcid() {
		return mcid;
	}

	public void setMcid(String mcid) {
		this.mcid = mcid;
	}

	public String getMcitem() {
		return mcitem;
	}

	public void setMcitem(String mcitem) {
		this.mcitem = mcitem;
	}

	public String getMctitle() {
		return mctitle;
	}

	public void setMctitle(String mctitle) {
		this.mctitle = mctitle;
	}
	
	public String getMccontentid() {
		return mccontentid;
	}

	public void setMccontentid(String mccontentid) {
		this.mccontentid = mccontentid;
	}

	public String getMcinsertdate() {
		return mcinsertdate;
	}

	public void setMcinsertdate(String mcinsertdate) {
		this.mcinsertdate = mcinsertdate;
	}

	public String getMcupdatedate() {
		return mcupdatedate;
	}

	public void setMcupdatedate(String mcupdatedate) {
		this.mcupdatedate = mcupdatedate;
	}

	public String getMcrecordinsertdate() {
		return mcrecordinsertdate;
	}

	public void setMcrecordinsertdate(String mcrecordinsertdate) {
		this.mcrecordinsertdate = mcrecordinsertdate;
	}

	public String getMcrecordupdatedate() {
		return mcrecordupdatedate;
	}

	public void setMcrecordupdatedate(String mcrecordupdatedate) {
		this.mcrecordupdatedate = mcrecordupdatedate;
	}
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
}
