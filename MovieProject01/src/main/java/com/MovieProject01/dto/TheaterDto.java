package com.MovieProject01.dto;

public class TheaterDto {
	
	private String thcode;
	private String thname;
	private String thaddress;
	private String thtel;
	private int thstate;
	public String getThcode() {
		return thcode;
	}
	public void setThcode(String thcode) {
		this.thcode = thcode;
	}
	public String getThname() {
		return thname;
	}
	public void setThname(String thname) {
		this.thname = thname;
	}
	public String getThaddress() {
		return thaddress;
	}
	public void setThaddress(String thaddress) {
		this.thaddress = thaddress;
	}
	public String getThtel() {
		return thtel;
	}
	public void setThtel(String thtel) {
		this.thtel = thtel;
	}
	public int getThstate() {
		return thstate;
	}
	public void setThstate(int thstate) {
		this.thstate = thstate;
	}
	@Override
	public String toString() {
		return "TheaterDto [thcode=" + thcode + ", thname=" + thname + ", thaddress=" + thaddress + ", thtel=" + thtel
				+ ", thstate=" + thstate + "]";
	}
	
	
	
}
