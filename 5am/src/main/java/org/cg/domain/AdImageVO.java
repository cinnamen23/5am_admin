package org.cg.domain;

import java.sql.Timestamp;

public class AdImageVO {

	private String imid;
	private String sid; 
	private Timestamp regdate;
	private Timestamp updategdate;
	
	public String getImid() {
		return imid;
	}
	public void setImid(String imid) {
		this.imid = imid;
	}
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
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
		return "AddImageVO [imid=" + imid + ", sid=" + sid + ", regdate=" + regdate + ", updategdate=" + updategdate
				+ "]";
	}
	
	
	
}
