package com.MovieProject01.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.MovieProject01.dto.MovieCommentDto;
import com.MovieProject01.dto.ReservationDto;
import com.MovieProject01.service.MoiveService;

@Controller
public class MovieController {
	
	private ModelAndView mav;
	
	@Autowired
	private MoiveService movSvc;
	
	@RequestMapping(value = "/movieReservation")
	public ModelAndView movieRervation(String movcode) {
		System.out.println("/movieReservation 영화예매 페이지 이동 요청");
		System.out.println(movcode);
		
		
		mav = movSvc.movieReservation();
		
		return mav;
	}
	
	@RequestMapping(value = "/theaterList")
	public @ResponseBody String theaterList(String movcode) {
		System.out.println("/theaterList 영화관 목록 조회 요청");
		System.out.println("선택한 영화코드 : " + movcode);
		String theaterList = movSvc.getTheaterList(movcode);
		
		return theaterList;
	}
	
	@RequestMapping(value = "/scDateList")
	public @ResponseBody String scDateList(String movcode, String thcode) {
		System.out.println("/scDateList 상영 날짜 조회 요청");
		System.out.println("선택한 영화 코드 : " + movcode);
		System.out.println("선택한 영화관코드 : " + thcode);
		
		
		String scDateList = movSvc.getScDateList(movcode, thcode);
		
		
		return scDateList;
	}

	@RequestMapping(value = "/scHallTimeList")
	public @ResponseBody String scHallTimeList(String movcode, String thcode, String scDate) {
		System.out.println("/scHallTimeList 상영관 및 시간 조회 요청");
		System.out.println("선택한 영화 코드 : " + movcode);
		System.out.println("선택한 영화관코드 : " + thcode);
		System.out.println("선택한 날짜 : " + scDate);
		
		String scHallTimeList = movSvc.getScHallTimeList(movcode, thcode, scDate);
		
		return scHallTimeList;
	}
	
	@RequestMapping(value = "/reserveMovie")
	public ModelAndView reserveMovie(ReservationDto reserve) {
		System.out.println("/reserveMovie 예매정보 입력 요청 ");
		System.out.println(reserve);
		
		mav = movSvc.reserveMoive(reserve);
		
		return mav;
	}
	
	@RequestMapping(value ="/moviereserveList")
	public ModelAndView moviereserveList(String remid) {
		System.out.println("/moviereserveList 예매확인 페이지 이동 요청");
		System.out.println("예매자 아이디 : " +  remid);
		
		mav = movSvc.moviereserveList(remid);
		
		return mav;
	}
	
	
	@RequestMapping(value = "/movieInfo")
	public ModelAndView movieInfo(String movcode) {
		System.out.println("/movieInfo 영화정보 페이지 이동 요청");
		
		mav = movSvc.movieInfo(movcode);
		
		return mav;
	}
	
	@RequestMapping(value = "/movieList")
	public ModelAndView movieList() {
		System.out.println("/movieList 영화목록 페이지 이동 요청");
		
		mav = movSvc.movieList();
		
		return mav;
	}
	
	@RequestMapping(value = "/reserveCancel")
	public ModelAndView reserveCancel(String recode) {
		System.out.println("/reserveCancel 예매 취소 요청");
		System.out.println("취소할 예매코드 : " + recode);
		
		mav = movSvc.reserveCancel(recode);
		
		return mav;
	}

	@RequestMapping(value = "/movieCommentForm")
	public ModelAndView movieCommentForm(String recode) {
		System.out.println("/movieCommentForm 관람평 작성 페이지 이동 요청");
		
		mav = movSvc.movieCommentForm(recode);
		
		return mav;
	}
	
	@RequestMapping(value = "/movieCommentWrite")
	public ModelAndView movieCommentWrite(MovieCommentDto comment) {
		System.out.println("/movieCommentWrite 관람평 등록 요쳥");
		System.out.println(comment);
		
		mav = movSvc.movieCommentWrite(comment);
		
		return mav;
		
	}
	
	@RequestMapping(value ="/movieCommentView")
	public ModelAndView movieCommentCheck(String mc_recode) {
		System.out.println("/movieCommentCheck 관람평 확인 요청");
		System.out.println("작성한 예매 코드 : " + mc_recode);
		mav = movSvc.movieCommentView(mc_recode);
		
		return mav;
	}
	
	@RequestMapping(value = "/searchMovie")
	public ModelAndView searchMovie(String movieSearch) {
		System.out.println("/movieSearch 영화 검색 요청");
		System.out.println("입력한 검색내용 : " + movieSearch);
		
		mav = movSvc.searchMovie(movieSearch);
		
		return mav;
	}
	
	

	
}
