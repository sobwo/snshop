package com.myteam.myapp.domain;

public class AdminWriteVo {

	public String getCategorytitle() {
		return categorytitle;
	}
	public void setCategorytitle(String categorytitle) {
		this.categorytitle = categorytitle;
	}
	private int AWboardNo;
	private String AWcontents;
	private String  categorytitle;
	private String AWtitle;
	public String getAWtitle() {
		return AWtitle;
	}
	public void setAWtitle(String aWtitle) {
		AWtitle = aWtitle;
	}
	private String AWwriteday; 
	private String delYn;
	
	
	public int getAWboardNo() {
		return AWboardNo;
	}
	public void setAWboardNo(int aWboardNo) {
		AWboardNo = aWboardNo;
	}
	public String getAWcontents() {
		return AWcontents;
	}
	public void setAWcontents(String aWcontents) {
		AWcontents = aWcontents;
	}
	public String getAWwriteday() {
		return AWwriteday;
	}
	public void setAWwriteday(String aWwriteday) {
		AWwriteday = aWwriteday;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	} 

}
