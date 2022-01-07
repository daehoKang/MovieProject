package com.MovieProject01.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.MovieProject01.dto.MemberDto;
import com.MovieProject01.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService memSvc;
	
	private ModelAndView mav;
	
	
	@RequestMapping(value ="/home")
	public String home() {
		System.out.println("/home 메인 페이지 이동");
		
		return "home";
	}
	
	@RequestMapping(value = "/memberJoinForm")
	public String memberJoinForm() {
		System.out.println("/memberJoinForm 회원가입 페이지 이동");
		
		return "member/MemberJoinForm";
	}
	
	@RequestMapping(value = "/memberJoin")
	public ModelAndView memberJoin(MemberDto member) throws IllegalStateException, IOException {
		System.out.println("/memberJoin 회원가입 요청");
		System.out.println("입력한 회원가입 정보 : " + member);
		
		mav = memSvc.registMember(member);
		
		return mav;
	}
	
	@RequestMapping(value = "/memberIdCheck")
	public @ResponseBody String MemberIdCheck(String userInputId) {
		System.out.println("/memberIdCheck 아이디 중복확인");
		System.out.println("입력한 아이디 : " + userInputId);
		
		String checkResult = memSvc.checkMemberId(userInputId);
		
		
		return checkResult;
	}
	
	@RequestMapping(value = "/memberLoginForm")
	public String memberLoginForm() {
		System.out.println("/memberLoginForm 로그인 페이지 이동");
		
		return "member/MemberLoginForm";
	}
	
	@RequestMapping(value = "/memberLogin")
	public ModelAndView memberLogin(String mid, String mpw) {
		System.out.println("/memberLogin 로그인 요청");
		System.out.println("아이디 : " + mid + " , 비밀번호 : " + mpw);
		mav = memSvc.loginMember(mid,mpw);
		
		return mav;
	}
	
	@RequestMapping(value = "/memberLogout")
	public ModelAndView memberLogout() {
		System.out.println("/memberLogout 로그아웃 요청");
		
		mav = memSvc.memberLogout();
		
		return mav;
	}
	
	@RequestMapping(value ="/memberView")
	public ModelAndView memberView(String mid) {
		System.out.println("memberView 내정보보기 페이지 이동 요청");
		
		mav = memSvc.memberView(mid);
		
		return mav;
	}
}
