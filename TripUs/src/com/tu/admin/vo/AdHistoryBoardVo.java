package com.tu.admin.vo;

public class AdHistoryBoardVo {
	
		//field
		private String adhistoryno;                   //Post number 
		private String adhistoryid;                   //Post id
		private String adhistorytitle;	              //Post title
		private String adhistorycontent;	          //Post content   
		private String adhistoryfile;	              //Post upload file   
		private String adhistoryetc;             	  //Post etc
		private String adhistorydeleteyn;             //Post deleteyn
		private String adhistoryinsertdate;	       	  //Post insertdate
		private String adhistoryupdatedate;	          //Post updatedate
		private String adhistoryrecordinsertdate;	  //Post recordinsertdate
		private String adhistoryrecordupdatedate;     //Post recordupdatedate
		
		//search field
		private String adhistorysearchcondition;      //search <select>
		private String adhistorysearchkeyword;        //search keyword

		//paging field
		public int pageno;
		public int totalcount;
		
		//constructor
		public AdHistoryBoardVo() {
		}

		public AdHistoryBoardVo(String adhistoryno, String adhistoryid,
				String adhistorytitle, String adhistorycontent,
				String adhistoryfile, String adhistoryetc,
				String adhistorydeleteyn, String adhistoryinsertdate,
				String adhistoryupdatedate, String adhistoryrecordinsertdate,
				String adhistoryrecordupdatedate,
				String adhistorysearchcondition, String adhistorysearchkeyword,
				int pageno, int totalcount) {
			super();
			this.adhistoryno = adhistoryno;
			this.adhistoryid = adhistoryid;
			this.adhistorytitle = adhistorytitle;
			this.adhistorycontent = adhistorycontent;
			this.adhistoryfile = adhistoryfile;
			this.adhistoryetc = adhistoryetc;
			this.adhistorydeleteyn = adhistorydeleteyn;
			this.adhistoryinsertdate = adhistoryinsertdate;
			this.adhistoryupdatedate = adhistoryupdatedate;
			this.adhistoryrecordinsertdate = adhistoryrecordinsertdate;
			this.adhistoryrecordupdatedate = adhistoryrecordupdatedate;
			this.adhistorysearchcondition = adhistorysearchcondition;
			this.adhistorysearchkeyword = adhistorysearchkeyword;
			this.pageno = pageno;
			this.totalcount = totalcount;
		}

		//GET & SET method

		public String getAdhistoryno() {
			return adhistoryno;
		}

		public String getAdhistoryid() {
			return adhistoryid;
		}

		public String getAdhistorytitle() {
			return adhistorytitle;
		}

		public String getAdhistorycontent() {
			return adhistorycontent;
		}

		public String getAdhistoryfile() {
			return adhistoryfile;
		}

		public String getAdhistoryetc() {
			return adhistoryetc;
		}

		public String getAdhistorydeleteyn() {
			return adhistorydeleteyn;
		}

		public String getAdhistoryinsertdate() {
			return adhistoryinsertdate;
		}

		public String getAdhistoryupdatedate() {
			return adhistoryupdatedate;
		}

		public String getAdhistoryrecordinsertdate() {
			return adhistoryrecordinsertdate;
		}

		public String getAdhistoryrecordupdatedate() {
			return adhistoryrecordupdatedate;
		}

		public String getAdhistorysearchcondition() {
			return adhistorysearchcondition;
		}

		public String getAdhistorysearchkeyword() {
			return adhistorysearchkeyword;
		}

		public void setAdhistoryno(String adhistoryno) {
			this.adhistoryno = adhistoryno;
		}

		public void setAdhistoryid(String adhistoryid) {
			this.adhistoryid = adhistoryid;
		}

		public void setAdhistorytitle(String adhistorytitle) {
			this.adhistorytitle = adhistorytitle;
		}

		public void setAdhistorycontent(String adhistorycontent) {
			this.adhistorycontent = adhistorycontent;
		}

		public void setAdhistoryfile(String adhistoryfile) {
			this.adhistoryfile = adhistoryfile;
		}

		public void setAdhistoryetc(String adhistoryetc) {
			this.adhistoryetc = adhistoryetc;
		}

		public void setAdhistorydeleteyn(String adhistorydeleteyn) {
			this.adhistorydeleteyn = adhistorydeleteyn;
		}

		public void setAdhistoryinsertdate(String adhistoryinsertdate) {
			this.adhistoryinsertdate = adhistoryinsertdate;
		}

		public void setAdhistoryupdatedate(String adhistoryupdatedate) {
			this.adhistoryupdatedate = adhistoryupdatedate;
		}

		public void setAdhistoryrecordinsertdate(String adhistoryrecordinsertdate) {
			this.adhistoryrecordinsertdate = adhistoryrecordinsertdate;
		}

		public void setAdhistoryrecordupdatedate(String adhistoryrecordupdatedate) {
			this.adhistoryrecordupdatedate = adhistoryrecordupdatedate;
		}

		public void setAdhistorysearchcondition(String adhistorysearchcondition) {
			this.adhistorysearchcondition = adhistorysearchcondition;
		}

		public void setAdhistorysearchkeyword(String adhistorysearchkeyword) {
			this.adhistorysearchkeyword = adhistorysearchkeyword;
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

		
		//toString()
		@Override
		public String toString() {
			return "AdHistoryBoardVo [adhistoryno=" + adhistoryno
					+ ", adhistoryid=" + adhistoryid + ", adhistorytitle="
					+ adhistorytitle + ", adhistorycontent=" + adhistorycontent
					+ ", adhistoryfile=" + adhistoryfile + ", adhistoryetc="
					+ adhistoryetc + ", adhistorydeleteyn=" + adhistorydeleteyn
					+ ", adhistoryinsertdate=" + adhistoryinsertdate
					+ ", adhistoryupdatedate=" + adhistoryupdatedate
					+ ", adhistoryrecordinsertdate="
					+ adhistoryrecordinsertdate
					+ ", adhistoryrecordupdatedate="
					+ adhistoryrecordupdatedate + ", adhistorysearchcondition="
					+ adhistorysearchcondition + ", adhistorysearchkeyword="
					+ adhistorysearchkeyword + ", pageno=" + pageno
					+ ", totalcount=" + totalcount + "]";
		}

		
}
