package com.MovieProject01.dto;

public class CommentDto {

	private String movname;
	private String movcode;
	private String movposter;
	private String resctime;
	private String thname;
	private String reschall;
	private int recount;
	private String recode;
	private String mc_recode;
	
	
	public String getMovname() {
		return movname;
	}
	public void setMovname(String movname) {
		this.movname = movname;
	}
	public String getMovcode() {
		return movcode;
	}
	public void setMovcode(String movcode) {
		this.movcode = movcode;
	}
	public String getMovposter() {
		return movposter;
	}
	public void setMovposter(String movposter) {
		this.movposter = movposter;
	}
	public String getResctime() {
		return resctime;
	}
	public void setResctime(String resctime) {
		this.resctime = resctime;
	}
	public String getThname() {
		return thname;
	}
	public void setThname(String thname) {
		this.thname = thname;
	}
	public String getReschall() {
		return reschall;
	}
	public void setReschall(String reschall) {
		this.reschall = reschall;
	}
	public int getRecount() {
		return recount;
	}
	public void setRecount(int recount) {
		this.recount = recount;
	}
	public String getRecode() {
		return recode;
	}
	public void setRecode(String recode) {
		this.recode = recode;
	}
	public String getMc_recode() {
		return mc_recode;
	}
	public void setMc_recode(String mc_recode) {
		this.mc_recode = mc_recode;
	}
	@Override
	public String toString() {
		return "CommentDto [movname=" + movname + ", movcode=" + movcode + ", movposter=" + movposter + ", resctime="
				+ resctime + ", thname=" + thname + ", reschall=" + reschall + ", recount=" + recount + ", recode="
				+ recode + ", mc_recode=" + mc_recode + "]";
	}
	
	
}
