package org.cg.domain;

import java.sql.Timestamp;

public class ElevatorVO {

	private int eno;
	private String elvname;
	private String lat;
	private String lng;
	private Timestamp regdate;
	private Timestamp updatedate;
	public int getEno() {
		return eno;
	}
	public void setEno(int eno) {
		this.eno = eno;
	}
	public String getElvname() {
		return elvname;
	}
	public void setElvname(String elvname) {
		this.elvname = elvname;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLng() {
		return lng;
	}
	public void setLng(String lng) {
		this.lng = lng;
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
		return "ElevatorVO [eno=" + eno + ", elvname=" + elvname + ", lat=" + lat + ", lng=" + lng + ", regdate="
				+ regdate + ", updatedate=" + updatedate + "]";
	}
	
	
	
	
}
