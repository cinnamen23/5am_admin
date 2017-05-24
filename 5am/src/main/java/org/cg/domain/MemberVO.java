package org.cg.domain;

import java.sql.Timestamp;

public class MemberVO {
	
	String mid;
	String mpw;
	String mname;
	int mage;
	String mgender;
	String maddr;
	Timestamp regdate;
	Timestamp updatedate;
	
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpw() {
		return mpw;
	}
	public void setMpw(String mpw) {
		this.mpw = mpw;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public int getMage() {
		return mage;
	}
	public void setMage(int mage) {
		this.mage = mage;
	}
	public String getMgender() {
		return mgender;
	}
	public void setMgender(String mgender) {
		this.mgender = mgender;
	}
	public String getMaddr() {
		return maddr;
	}
	public void setMaddr(String maddr) {
		this.maddr = maddr;
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
		return "MemberVO [mid=" + mid + ", mpw=" + mpw + ", mname=" + mname + ", mage=" + mage + ", mgender=" + mgender
				+ ", maddr=" + maddr + ", regdate=" + regdate + ", updatedate=" + updatedate + "]";
	}
	

}
