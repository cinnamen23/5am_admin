package org.cg.domain;

import java.sql.Timestamp;

import javax.annotation.processing.SupportedSourceVersion;


public class LibraryFileVO {

	
	private int lno;
	private String lfilename, lfileid;
	private Timestamp regdate;
	public int getLno() {
		return lno;
	}
	public void setLno(int lno) {
		this.lno = lno;
	}
	public String getLfilename() {
		return lfilename;
	}
	public void setLfilename(String lfilename) {
		this.lfilename = lfilename;
	}
	public String getLfileid() {
		return lfileid;
	}
	public void setLfileid(String lfileid) {
		this.lfileid = lfileid;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "LibraryFileVO [lno=" + lno + ", lfilename=" + lfilename + ", lfileid=" + lfileid + ", regdate="
				+ regdate + "]";
	}

	
	

}
