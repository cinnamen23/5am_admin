package org.cg.domain;

import java.sql.Timestamp;

public class MAnswerVO {
	
	int mano, mqno;
	String title, content, sid;
	Timestamp regdate ,updatedate;
	
	public int getMano() {
		return mano;
	}
	public void setMano(int mano) {
		this.mano = mano;
	}
	public int getMqno() {
		return mqno;
	}
	public void setMqno(int mqno) {
		this.mqno = mqno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	@Override
	public String toString() {
		return "MAnswerVO [mano=" + mano + ", mqno=" + mqno + ", title=" + title + ", content=" + content + ", sid="
				+ sid + ", regdate=" + regdate + ", updatedate=" + updatedate + "]";
	}
	
	
	
	

}
