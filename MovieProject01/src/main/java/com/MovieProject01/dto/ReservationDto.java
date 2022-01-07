package com.MovieProject01.dto;

public class ReservationDto {

	private String recode;
	private String remid;
	private String reschall;
	private String resctime;
	private String rescthcode;
	private int recount;
	
	
	public String getRecode() {
		return recode;
	}
	public void setRecode(String recode) {
		this.recode = recode;
	}
	public String getRemid() {
		return remid;
	}
	public void setRemid(String remid) {
		this.remid = remid;
	}
	public String getReschall() {
		return reschall;
	}
	public void setReschall(String reschall) {
		this.reschall = reschall;
	}
	public String getResctime() {
		return resctime;
	}
	public void setResctime(String resctime) {
		this.resctime = resctime;
	}
	public String getRescthcode() {
		return rescthcode;
	}
	public void setRescthcode(String rescthcode) {
		this.rescthcode = rescthcode;
	}
	public int getRecount() {
		return recount;
	}
	public void setRecount(int recount) {
		this.recount = recount;
	}
	@Override
	public String toString() {
		return "ReservationDto [recode=" + recode + ", remid=" + remid + ", reschall=" + reschall + ", resctime="
				+ resctime + ", rescthcode=" + rescthcode + ", recount=" + recount + "]";
	}

	
}
	
	