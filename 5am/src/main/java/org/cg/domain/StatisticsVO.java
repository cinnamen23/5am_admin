package org.cg.domain;

public class StatisticsVO {
	
	private int sno;
	private String sid,target;
	private String happiness,contempt,surprise,neutral,sadness,disgust,anger,fear,scount,sview;
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	public String getHappiness() {
		return happiness;
	}
	public void setHappiness(String happiness) {
		this.happiness = happiness;
	}
	public String getContempt() {
		return contempt;
	}
	public void setContempt(String contempt) {
		this.contempt = contempt;
	}
	public String getSurprise() {
		return surprise;
	}
	public void setSurprise(String surprise) {
		this.surprise = surprise;
	}
	public String getNeutral() {
		return neutral;
	}
	public void setNeutral(String neutral) {
		this.neutral = neutral;
	}
	public String getSadness() {
		return sadness;
	}
	public void setSadness(String sadness) {
		this.sadness = sadness;
	}
	public String getDisgust() {
		return disgust;
	}
	public void setDisgust(String disgust) {
		this.disgust = disgust;
	}
	public String getAnger() {
		return anger;
	}
	public void setAnger(String anger) {
		this.anger = anger;
	}
	public String getFear() {
		return fear;
	}
	public void setFear(String fear) {
		this.fear = fear;
	}
	public String getScount() {
		return scount;
	}
	public void setScount(String scount) {
		this.scount = scount;
	}
	public String getSview() {
		return sview;
	}
	public void setSview(String sview) {
		this.sview = sview;
	}
	@Override
	public String toString() {
		return "StatisticsVO [sno=" + sno + ", sid=" + sid + ", target=" + target + ", happiness=" + happiness
				+ ", contempt=" + contempt + ", surprise=" + surprise + ", neutral=" + neutral + ", sadness=" + sadness
				+ ", disgust=" + disgust + ", anger=" + anger + ", fear=" + fear + ", scount=" + scount + ", sview="
				+ sview + "]";
	}
	

	
}
