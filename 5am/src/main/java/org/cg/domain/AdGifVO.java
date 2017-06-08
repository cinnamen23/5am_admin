package org.cg.domain;

import java.sql.Timestamp;

public class AdGifVO {

	
	private int gifno;
	private String gifname;
	private String sid; 
	private Timestamp regdate;
	private Timestamp updategdate;
	
	
	public int getGifno() {
		return gifno;
	}
	public void setGifno(int gifno) {
		this.gifno = gifno;
	}
	public String getGifname() {
		return gifname;
	}
	public void setGifname(String gifname) {
		this.gifname = gifname;
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
		return "AdGifVO [gifno=" + gifno + ", gifname=" + gifname + ", sid=" + sid + ", regdate=" + regdate
				+ ", updategdate=" + updategdate + "]";
	}
	

	
	
}
