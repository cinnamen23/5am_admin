package org.cg.domain;

import java.sql.Timestamp;

public class AdGifVO {

	
	private int gno;
	private String sid; 
	private Timestamp regdate;
	private Timestamp updategdate;
	public int getGno() {
		return gno;
	}
	public void setGno(int gno) {
		this.gno = gno;
	}
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public Timestamp getUpdategdate() {
		return updategdate;
	}
	public void setUpdategdate(Timestamp updategdate) {
		this.updategdate = updategdate;
	}
	@Override
	public String toString() {
		return "AddGifVO [gno=" + gno + ", sid=" + sid + ", regdate=" + regdate + ", updategdate=" + updategdate + "]";
	}

	
	
}
