package org.cg.dto;

public class LoginDTO {
	
	private String sid;
	private String spw;
	private boolean useCookie;
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
	public boolean isUseCookie() {
		return useCookie;
	}
	public void setUseCookie(boolean useCookie) {
		this.useCookie = useCookie;
	}
	@Override
	public String toString() {
		return "LoginDTO [sid=" + sid + ", spw=" + spw + ", useCookie=" + useCookie + "]";
	}
	
	
	
	
	
}
