package org.cg.domain;

import java.sql.Timestamp;

public class QfileVO {

	private int fno;
	private int fqno;
	private String filename;
	private Timestamp regdate;
	private Timestamp updatedate;
	
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public int getFqno() {
		return fqno;
	}
	public void setFqno(int fqno) {
		this.fqno = fqno;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public Timestamp getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Timestamp updatedate) {
		this.updatedate = updatedate;
	}
	@Override
	public String toString() {
		return "QfileVO [fno=" + fno + ", fqno=" + fqno + ", filename=" + filename + ", regdate=" + regdate
				+ ", updatedate=" + updatedate + "]";
	}

	
	
	
}
