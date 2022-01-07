package com.MovieProject01.dto;

import org.springframework.web.multipart.MultipartFile;

public class MemberDto {

	private String mid;					//아이디
	private String mpw;					//비밀번호
	private String mname;				//이름
	private String mbirth;				//생년월일
	private String memail;				//이메일
	
	private String postcode;			//우편번호
	private String address;				//주소
	private String detailAddress;		//상세주소
	private String extraAddress;		//참고항목
	private String maddress;			//전체주소
	
	private MultipartFile mfile;		//프로필파일
	
	private String mfilename;			//프로필파일이름

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getMpw() {
		return mpw;
	}

	public void setMpw(String mpw) {
		this.mpw = mpw;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMbirth() {
		return mbirth;
	}

	public void setMbirth(String mbirth) {
		this.mbirth = mbirth;
	}

	public String getMemail() {
		return memail;
	}

	public void setMemail(String memail) {
		this.memail = memail;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDetailAddress() {
		return detailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}

	public String getExtraAddress() {
		return extraAddress;
	}

	public void setExtraAddress(String extraAddress) {
		this.extraAddress = extraAddress;
	}

	public String getMaddress() {
		return maddress;
	}

	public void setMaddress(String maddress) {
		this.maddress = maddress;
	}

	public MultipartFile getMfile() {
		return mfile;
	}

	public void setMfile(MultipartFile mfile) {
		this.mfile = mfile;
	}

	public String getMfilename() {
		return mfilename;
	}

	public void setMfilename(String mfilename) {
		this.mfilename = mfilename;
	}

	@Override
	public String toString() {
		return "MemberDto [mid=" + mid + ", mpw=" + mpw + ", mname=" + mname + ", mbirth=" + mbirth + ", memail="
				+ memail + ", postcode=" + postcode + ", address=" + address + ", detailAddress=" + detailAddress
				+ ", extraAddress=" + extraAddress + ", maddress=" + maddress + ", mfile=" + mfile + ", mfilename="
				+ mfilename + "]";
	}

	
}
