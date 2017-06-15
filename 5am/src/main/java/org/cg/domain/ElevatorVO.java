package org.cg.domain;

import java.sql.Timestamp;

public class ElevatorVO {

	private int ENO;
	private String ELVNAME;
	private String LAT;
	private String LNG;
	private Timestamp REGDATE;
	private Timestamp UPDATEDATE;
	public int getENO() {
		return ENO;
	}
	public void setENO(int eNO) {
		ENO = eNO;
	}
	public String getELVNAME() {
		return ELVNAME;
	}
	public void setELVNAME(String eLVNAME) {
		ELVNAME = eLVNAME;
	}
	public String getLAT() {
		return LAT;
	}
	public void setLAT(String lAT) {
		LAT = lAT;
	}
	public String getLNG() {
		return LNG;
	}
	public void setLNG(String lNG) {
		LNG = lNG;
	}
	public Timestamp getREGDATE() {
		return REGDATE;
	}
	public void setREGDATE(Timestamp rEGDATE) {
		REGDATE = rEGDATE;
	}
	public Timestamp getUPDATEDATE() {
		return UPDATEDATE;
	}
	public void setUPDATEDATE(Timestamp uPDATEDATE) {
		UPDATEDATE = uPDATEDATE;
	}
	@Override
	public String toString() {
		return "ElevatorVO [ENO=" + ENO + ", ELVNAME=" + ELVNAME + ", LAT=" + LAT + ", LNG=" + LNG + ", REGDATE="
				+ REGDATE + ", UPDATEDATE=" + UPDATEDATE + "]";
	}
	
	
	
}
