package org.cg.domain;

import java.sql.Timestamp;

public class AdGifVO {

	
	private int gifno;
	private String gifname;
	private String sid; 
	private String target1,target2,target3,target4;
	private int Area;
	private String startdate;
	private String enddate;
	private Timestamp regdate;
	private Timestamp updategdate;
	private String elvname;
	
	public String getElvname() {
		return elvname;
	}

	public void setElvname(String elvname) {
		this.elvname = elvname;
	}

	public String getStartdate() {
		return startdate;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public String getEnddate() {
		return enddate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}

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
	public String getTarget1() {
		return target1;
	}
	public void setTarget1(String target1) {
		this.target1 = target1;
	}
	public String getTarget2() {
		return target2;
	}
	public void setTarget2(String target2) {
		this.target2 = target2;
	}
	public String getTarget3() {
		return target3;
	}
	public void setTarget3(String target3) {
		this.target3 = target3;
	}
	public String getTarget4() {
		return target4;
	}
	public void setTarget4(String target4) {
		this.target4 = target4;
	}
	public int getArea() {
		return Area;
	}
	public void setArea(int area) {
		Area = area;
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
		return "AdGifVO [gifno=" + gifno + ", gifname=" + gifname + ", sid=" + sid + ", target1=" + target1
				+ ", target2=" + target2 + ", target3=" + target3 + ", target4=" + target4 + ", Area=" + Area
				+ ", startdate=" + startdate + ", enddate=" + enddate + ", regdate=" + regdate + ", updategdate="
				+ updategdate + ", elvname=" + elvname + "]";
	}




	
	
}
