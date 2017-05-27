package org.cg.domain;

public class StoreVO {
	
	private String sid;
	private String spw;
	private String sname;
	
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public String getSpw() {
		return spw;
	}
	public void setSpw(String spw) {
		this.spw = spw;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	@Override
	public String toString() {
		return "StoreVO [sid=" + sid + ", spw=" + spw + ", sname=" + sname + "]";
	}
	
	
	
	
}
