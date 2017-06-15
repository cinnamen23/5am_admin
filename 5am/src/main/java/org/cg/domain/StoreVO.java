package org.cg.domain;

import java.sql.Timestamp;

public class StoreVO {
	
	private String sid,spw,sname,saddr,sphone,semail,saddrm,lat,lng,gubun;
	private Timestamp regdate,updatedate;
	
	
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
	public String getSaddr() {
		return saddr;
	}
	public void setSaddr(String saddr) {
		this.saddr = saddr;
	}
	public String getSphone() {
		return sphone;
	}
	public void setSphone(String sphone) {
		this.sphone = sphone;
	}
	public String getSemail() {
		return semail;
	}
	public void setSemail(String semail) {
		this.semail = semail;
	}
	public String getSaddrm() {
		return saddrm;
	}
	public void setSaddrm(String saddrm) {
		this.saddrm = saddrm;
	}
	public String getLat() {
		return lat;
	}
	public Double getDLat(){
		
		return Double.parseDouble(lat);
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLng() {
		return lng;
	}
	public Double getDLng(){
		
		return Double.parseDouble(lng);
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
	public String getGubun() {
		return gubun;
	}
	public void setGubun(String gubun) {
		this.gubun = gubun;
	}
	@Override
	public String toString() {
		return "StoreVO [sid=" + sid + ", spw=" + spw + ", sname=" + sname + ", saddr=" + saddr + ", sphone=" + sphone
				+ ", semail=" + semail + ", saddrm=" + saddrm + ", lat=" + lat + ", lng=" + lng + ", gubun=" + gubun
				+ ", regdate=" + regdate + ", updatedate=" + updatedate + "]";
	}
	
	
	
	
}
