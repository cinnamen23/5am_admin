package org.cg.domain;

import java.sql.Timestamp;

public class QuestionVO {
private int qno;
private String title;
private String content;
private String writer;
private Timestamp regdate;
private Timestamp updatedate;

public int getQno() {
	return qno;
}
public void setQno(int qno) {
	this.qno = qno;
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
public String getWriter() {
	return writer;
}
public void setWriter(String writer) {
	this.writer = writer;
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
	return "QnaVO [qno=" + qno + ", title=" + title + ", content=" + content + ", writer=" + writer + ", regdate="
			+ regdate + ", updatedate=" + updatedate + "]";
}




}
