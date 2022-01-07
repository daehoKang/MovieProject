package com.MovieProject01.dto;

import org.springframework.web.multipart.MultipartFile;

public class MovieDto {

	private String movcode;
	private String movname;
	private String movdirector;
	private String movgenre;
	private int movgrade;
	private String movopen;
	private String movposter;
	private MultipartFile pfile;
	
	private int goodRatio;
	
	private int advance;

	private int movstate;

	public String getMovcode() {
		return movcode;
	}

	public void setMovcode(String movcode) {
		this.movcode = movcode;
	}

	public String getMovname() {
		return movname;
	}

	public void setMovname(String movname) {
		this.movname = movname;
	}

	public String getMovdirector() {
		return movdirector;
	}

	public void setMovdirector(String movdirector) {
		this.movdirector = movdirector;
	}

	public String getMovgenre() {
		return movgenre;
	}

	public void setMovgenre(String movgenre) {
		this.movgenre = movgenre;
	}

	public int getMovgrade() {
		return movgrade;
	}

	public void setMovgrade(int movgrade) {
		this.movgrade = movgrade;
	}

	public String getMovopen() {
		return movopen;
	}

	public void setMovopen(String movopen) {
		this.movopen = movopen;
	}

	public String getMovposter() {
		return movposter;
	}

	public void setMovposter(String movposter) {
		this.movposter = movposter;
	}

	public MultipartFile getPfile() {
		return pfile;
	}

	public void setPfile(MultipartFile pfile) {
		this.pfile = pfile;
	}

	public int getGoodRatio() {
		return goodRatio;
	}

	public void setGoodRatio(int goodRatio) {
		this.goodRatio = goodRatio;
	}

	public int getAdvance() {
		return advance;
	}

	public void setAdvance(int advance) {
		this.advance = advance;
	}

	public int getMovstate() {
		return movstate;
	}

	public void setMovstate(int movstate) {
		this.movstate = movstate;
	}

	@Override
	public String toString() {
		return "MovieDto [movcode=" + movcode + ", movname=" + movname + ", movdirector=" + movdirector + ", movgenre="
				+ movgenre + ", movgrade=" + movgrade + ", movopen=" + movopen + ", movposter=" + movposter + ", pfile="
				+ pfile + ", goodRatio=" + goodRatio + ", advance=" + advance + ", movstate=" + movstate + "]";
	}
	

	
}
