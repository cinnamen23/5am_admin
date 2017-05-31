package org.cg.domain;

import java.sql.Timestamp;

import javax.annotation.processing.SupportedSourceVersion;


public class LibraryVO {

	
	private int lno, hit;
	private String ltitle, lcontent;
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
		return "LibraryVO [lno=" + lno + ", hit=" + hit + ", ltitle=" + ltitle + ", lcontent=" + lcontent + ", regdate="
				+ regdate + ", updatedate=" + updatedate + "]";
	}
	
	
	
	

}
