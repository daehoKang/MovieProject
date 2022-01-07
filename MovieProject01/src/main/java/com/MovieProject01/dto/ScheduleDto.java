package com.MovieProject01.dto;

import java.util.Arrays;

public class ScheduleDto {
	
	private String schall;
	private String sctime;
	private String scthcode;
	private String scmovcode;
	
	private String[] scHallTimeArr;
	
	private String scdate;

	public String getSchall() {
		return schall;
	}

	public void setSchall(String schall) {
		this.schall = schall;
	}

	public String getSctime() {
		return sctime;
	}

	public void setSctime(String sctime) {
		this.sctime = sctime;
	}

	public String getScthcode() {
		return scthcode;
	}

	public void setScthcode(String scthcode) {
		this.scthcode = scthcode;
	}

	public String getScmovcode() {
		return scmovcode;
	}

	public void setScmovcode(String scmovcode) {
		this.scmovcode = scmovcode;
	}

	public String[] getScHallTimeArr() {
		return scHallTimeArr;
	}

	public void setScHallTimeArr(String[] scHallTimeArr) {
		this.scHallTimeArr = scHallTimeArr;
	}

	public String getScdate() {
		return scdate;
	}

	public void setScdate(String scdate) {
		this.scdate = scdate;
	}

	@Override
	public String toString() {
		return "ScheduleDto [schall=" + schall + ", sctime=" + sctime + ", scthcode=" + scthcode + ", scmovcode="
				+ scmovcode + ", scHallTimeArr=" + Arrays.toString(scHallTimeArr) + ", scdate=" + scdate + "]";
	}
	
	
	

}
