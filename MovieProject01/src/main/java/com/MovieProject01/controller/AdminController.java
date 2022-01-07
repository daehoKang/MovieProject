package com.MovieProject01.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.MovieProject01.dto.MemberDto;
import com.MovieProject01.dto.MovieDto;
import com.MovieProject01.dto.ScheduleDto;
import com.MovieProject01.dto.TheaterDto;
import com.MovieProject01.service.AdminService;

@Controller
public class AdminController {
	
	private ModelAndView mav;
	
	@Autowired
	private AdminService adminSvc;

	
	
	@RequestMapping(value = "/Admin_memberList")
	public ModelAndView Admin_memberList() {
		System.out.println("/Admin_memberList_관리자_전체회원목록 페이지");
		
		mav = adminSvc.Admin_memberList();
		
		return mav;
	}
	
	@RequestMapping(value = "/Admin_MemberModify")
	public ModelAndView Admin_MemberModify(MemberDto memberInfo, RedirectAttributes ra) {
		System.out.println("Admin_MemberModify_관리자_회원정보수정");
		
		mav = adminSvc.Admin_MemberModify(memberInfo,ra);
		
		return mav;
	}
	
	@RequestMapping(value = "/Admin_getMemberReserveList")
	public @ResponseBody String Admin_getMemberReserveList(String remid) {
		System.out.println("/MovieReserveListView_관리자_회원 예매확인");
		
		String reserveList = adminSvc.Admin_getMemberReserveList(remid);
		
		return reserveList;
	}
	
	@RequestMapping(value ="/Admin_MovieList")
	public ModelAndView Admin_MovieList() {
		
		mav = adminSvc.Admin_MovieList();
		
		return mav;
	}
	
	@RequestMapping(value ="/Admin_MovieModify")
	public ModelAndView Admin_MovieModify(MovieDto movieInfo,RedirectAttributes ra) {
		
		mav = adminSvc.Admin_MovieModify(movieInfo, ra);
		
		return mav;
	}
	
	@RequestMapping(value = "/Admin_MovieRegistForm")
	public String Admin_MovieRegistForm() {
		System.out.println("/Admin_MovieRegistForm_관리자 영화등록페이지 이동 요청");
		
		return "admin/Admin_MovieRegistForm";
	}
	
	@RequestMapping(value = "/Admin_MovieRegist")
	public ModelAndView Admin_MovieRegist(MovieDto movie) throws IllegalStateException, IOException{
		System.out.println("/Admin_MovieRegist_관리자 영화등록요청");
		System.out.println("입력한 영화 정보 : " +  movie);

		mav = adminSvc.Admin_MovieRegist(movie);
		
		return mav;
	}
	
	@RequestMapping(value = "/Admin_MovState")
	public ModelAndView Admin_MovState(String movcode, int movstate) {
		System.out.println("/Admin_MovState 관리자_예매시작/중지 요청");
		System.out.println("movcode : " + movcode + ", movstate : " + movstate);
		
		mav = adminSvc.Admin_MovState(movcode, movstate);
		
		return mav;

	}
	
	@RequestMapping(value = "/Admin_TheaterList")
	public ModelAndView Admin_TheaterList(){
		System.out.println("/Admin_TheaterList_관리자_영화관목록 요청");
		
		mav = adminSvc.Admin_TheaterList();
		
		return mav;
	}
	
	@RequestMapping(value = "/Admin_TheaterModify")
	public ModelAndView Admin_TheaterModify(TheaterDto theaterInfo, RedirectAttributes ra) {
		System.out.println("/Admin_TheaterModify_관리자_영화관 수정 요청");
		
		mav = adminSvc.Admin_TheaterModify(theaterInfo, ra);
		
		return mav;
	}
	
	@RequestMapping(value = "/Admin_ThState")
	public ModelAndView Admin_ThState(String thcode, int thstate) {
		System.out.println("Admin_ThState_관리자_영화관 활성화/중지");
		System.out.println("thcode : " + thcode + ", thstate : " + thstate);
		
		
		mav = adminSvc.Admin_ThState(thcode, thstate);
		
		return mav;
	}
	
	@RequestMapping(value = "/Admin_TheaterRegistForm")
	public String Admin_TheaterRegist() {
		System.out.println("/Admin_TheaterRegistForm_관리자_영화관등록페이지 요청");
		
		
		return "admin/Admin_TheaterRegistForm";
	}
	
	@RequestMapping(value ="/Admin_TheaterRegist")
	public ModelAndView Admin_TheaterRegist(TheaterDto theater) {
		System.out.println("Admin_TheaterRegist_관리자_영화관등록요청");
		
		mav = adminSvc.Admin_TheaterRegist(theater);
		
		return mav;
	}
	
	@RequestMapping(value ="/Admin_ScheduleRegistForm")
	public ModelAndView Admin_ScheduleRegistForm() {
		System.out.println("Admin_ScheduleRegistForm_관리자_스케줄등록페이지 이동 요청");
		
		mav = adminSvc.Admin_ScheduleRegistForm();
		
		return mav;
	}
	
	
	@RequestMapping(value = "/getTheaterScheduleList")
	public @ResponseBody String getTheaterScheduleList(String scthcode, String scdate) {
		System.out.println("/getTheaterScheduleList 관리자_선택영화관스케쥴 조회 요청");
		String theaterScheduleList = adminSvc.getTheaterScheduleList(scthcode,scdate);
		return theaterScheduleList;
		
	}
	
	@RequestMapping(value = "/Admin_ScheduleRegist")
	public ModelAndView Admin_ScheduleRegist(ScheduleDto schedule) {
		System.out.println("/Admin_ScheduleRegist 관리자_스케쥴 등록 요청");
		System.out.println(schedule);
		
		
		mav = adminSvc.Admin_ScheduleRegist(schedule);
		return mav;
		
	}
	
	@RequestMapping(value = "/Admin_test")
	public ModelAndView Admin_test(String[] schallTime) {
		for(int i=0; i<schallTime.length; i++) {
			System.out.println(schallTime[i]);
		}
		
		return null;
	}
	
}
