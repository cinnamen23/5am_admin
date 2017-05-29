package org.cg.domain;

import java.sql.Timestamp;

import javax.annotation.processing.SupportedSourceVersion;


public class LibraryVO {

	
	private int lno, hit;
	private String ltitle, lcontent, lfile, lfileid;
	private Timestamp regdate, updatedate;
	public int getLno() {
		return lno;
	}
	public void setLno(int lno) {
		this.lno = lno;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getLtitle() {
		return ltitle;
	}
	public void setLtitle(String ltitle) {
		this.ltitle = ltitle;
	}
	public String getLcontent() {
		return lcontent;
	}
	public void setLcontent(String lcontent) {
		this.lcontent = lcontent;
	}
	public String getLfile() {
		return lfile;
	}
	public void setLfile(String lfile) {
		this.lfile = lfile;
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
	public Timestamp getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Timestamp updatedate) {
		this.updatedate = updatedate;
	}
	@Override
	public String toString() {
		return "LibraryVO [lno=" + lno + ", hit=" + hit + ", ltitle=" + ltitle + ", lcontent=" + lcontent + ", lfile="
				+ lfile + ", lfileid=" + lfileid + ", regdate=" + regdate + ", updatedate=" + updatedate + "]";
	}
	
	
	

}
