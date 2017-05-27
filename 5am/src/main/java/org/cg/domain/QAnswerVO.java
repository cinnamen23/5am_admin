package org.cg.domain;

import java.sql.Timestamp;

public class QAnswerVO {

	private int aano;
	private int aqno;
	private String acontent;
	private String awriter;
	private Timestamp aregdate;
	private Timestamp aupdatedate;
	
	public int getAano() {
		return aano;
	}
	public void setAano(int aano) {
		this.aano = aano;
	}
	public int getAqno() {
		return aqno;
	}
	public void setAqno(int aqno) {
		this.aqno = aqno;
	}
	public String getAcontent() {
		return acontent;
	}
	public void setAcontent(String acontent) {
		this.acontent = acontent;
	}
	public String getAwriter() {
		return awriter;
	}
	public void setAwriter(String awriter) {
		this.awriter = awriter;
	}
	public Timestamp getAregdate() {
		return aregdate;
	}
	public void setAregdate(Timestamp aregdate) {
		this.aregdate = aregdate;
	}
	public Timestamp getAupdatedate() {
		return aupdatedate;
	}
	public void setAupdatedate(Timestamp aupdatedate) {
		this.aupdatedate = aupdatedate;
	}
	@Override
	public String toString() {
		return "QAnswerVO [aano=" + aano + ", aqno=" + aqno + ", acontent=" + acontent + ", awriter=" + awriter
				+ ", aregdate=" + aregdate + ", aupdatedate=" + aupdatedate + "]";
	}
	
	
	
	
	
	
}
