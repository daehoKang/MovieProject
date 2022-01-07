package com.MovieProject01.service;


import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.MovieProject01.dao.MemberDao;
import com.MovieProject01.dto.MemberDto;

@Service
public class MemberService {
	
	private ModelAndView mav;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private MemberDao mdao;
	

	private String savePath = "C:\\Spring_workspace\\MovieProject01\\src\\main\\webapp\\resources\\profile";
	
	
	
	public ModelAndView registMember(MemberDto member) throws IllegalStateException, IOException {
		System.out.println("MemberSerivce.registMember()");
		mav = new ModelAndView();
		
		//프로필 파일 첨부 확인
		MultipartFile mfile = member.getMfile();
		String mfilename = "";
		if(!mfile.isEmpty()) {
			UUID uuid = UUID.randomUUID();
			mfilename = uuid.toString()+"_"+mfile.getOriginalFilename();
			//프로필 파일 저장
			mfile.transferTo( new File(savePath, mfilename) );
		}
		
		member.setMfilename(mfilename);
		
		//주소
		String postcode = "[" + member.getPostcode() + "]";
		String address = member.getAddress();
		String extraAddress = member.getExtraAddress();
		String detailAddress = member.getDetailAddress();
		member.setMaddress(postcode + " " + address + extraAddress + " " + detailAddress );
		System.out.println(member.getMaddress());
		
		//회원가입처리
		
		int insertResult = mdao.insertMember(member);
		System.out.println("회원가입 결과 : " + insertResult );
		
		//페이지설정
		if(insertResult > 0) {
			System.out.println("회원가입 성공");
			mav.setViewName("home");
		} else {
			System.out.println("회원가입 실패");
		}
		
		
		return mav;
	}



	public String checkMemberId(String userInputId) {
		System.out.println("MemberService.checkMemberId()");
		
		String mid = mdao.checkMemberId(userInputId);
		System.out.println("중복확인 : " + mid);
		
		String checkResult = "NO";
		
		if(mid == null) {
			checkResult = "OK";
		}
		
		return checkResult;
	}



	public ModelAndView loginMember(String inputMid, String inputMpw) {
		System.out.println("memberService.memberLogin 요청");
		
		mav = new ModelAndView();
		//inputMid = admin, inputMpw : admin
	
		if(inputMid.equals("admin") && inputMpw.equals("admin")) {
			mav.setViewName("admin/Admin_home");
			
		} else {
		
		MemberDto loginMember = mdao.loginMember(inputMid,inputMpw);
		
		//아이디 비밀번호 확인
		if(loginMember != null) {
			//로그인성공
			System.out.println("로그인성공");
			//세션에 로그인 정보 저장
			session.setAttribute("loginId", loginMember.getMid());
			session.setAttribute("loginProfile", loginMember.getMfilename());
			mav.setViewName("home");
		} else {
			// 로그인 실패
			System.out.println("로그인실패");
			mav.setViewName("redirect:/memberLoginForm");
		}
	}
		return mav;
	} 
	


	public ModelAndView memberLogout() {
		System.out.println("MemberService.memberLogout()");
		
		mav = new ModelAndView();
		
		session.invalidate();
		
		mav.setViewName("home");
		
		return mav;
	}


	public ModelAndView memberView(String mid) {
		System.out.println("MemberService.memberView()");
		mav = new ModelAndView();
		
		MemberDto memberView = mdao.memberView(mid);
		
		mav.addObject("memberView", memberView);
		
		mav.setViewName("member/MemberView");
		return mav;
	}


}

