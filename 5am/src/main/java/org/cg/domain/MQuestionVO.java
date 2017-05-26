package org.cg.domain;

import java.sql.Timestamp;

public class MQuestionVO {
	
	int mqno,checked;
	String mid,	sid, title, question;
	Timestamp regdate, updatedate;
	
	public int getMqno() {
		return mqno;
	}
	public void setMqno(int mqno) {
		this.mqno = mqno;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
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
	
	public int getChecked() {
		return checked;
	}
	public void setChecked(int checked) {
		this.checked = checked;
	}
	
	@Override
	public String toString() {
		return "MQuestionVO [mqno=" + mqno + ", checked=" + checked + ", mid=" + mid + ", sid=" + sid + ", title="
				+ title + ", question=" + question + ", regdate=" + regdate + ", updatedate=" + updatedate + "]";
	}

}
