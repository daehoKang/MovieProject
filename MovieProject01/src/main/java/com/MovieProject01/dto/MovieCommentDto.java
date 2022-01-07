package com.MovieProject01.dto;

public class MovieCommentDto {

	private String mc_recode;
	private String mc_mid;
	private String mc_movcode;
	private String mc_comment;
	private String mc_recommend;
	private String mc_date;
	
	
	public String getMc_recode() {
		return mc_recode;
	}
	public void setMc_recode(String mc_recode) {
		this.mc_recode = mc_recode;
	}
	public String getMc_mid() {
		return mc_mid;
	}
	public void setMc_mid(String mc_mid) {
		this.mc_mid = mc_mid;
	}
	public String getMc_movcode() {
		return mc_movcode;
	}
	public void setMc_movcode(String mc_movcode) {
		this.mc_movcode = mc_movcode;
	}
	public String getMc_comment() {
		return mc_comment;
	}
	public void setMc_comment(String mc_comment) {
		this.mc_comment = mc_comment;
	}
	public String getMc_recommend() {
		return mc_recommend;
	}
	public void setMc_recommend(String mc_recommend) {
		this.mc_recommend = mc_recommend;
	}
	public String getMc_date() {
		return mc_date;
	}
	public void setMc_date(String mc_date) {
		this.mc_date = mc_date;
	}
	
	@Override
	public String toString() {
		return "MovieCommentDto [mc_recode=" + mc_recode + ", mc_mid=" + mc_mid + ", mc_movcode=" + mc_movcode
				+ ", mc_comment=" + mc_comment + ", mc_recommend=" + mc_recommend + ", mc_date=" + mc_date + "]";
	}
	
	
}
