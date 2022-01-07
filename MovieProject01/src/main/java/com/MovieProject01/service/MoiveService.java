package com.MovieProject01.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.MovieProject01.dao.MovieDao;
import com.MovieProject01.dto.CommentDto;
import com.MovieProject01.dto.MovieCommentDto;
import com.MovieProject01.dto.MovieDto;
import com.MovieProject01.dto.ReservationDto;
import com.MovieProject01.dto.ReserveInfoDto;
import com.MovieProject01.dto.TheaterDto;
import com.MovieProject01.dto.ScheduleDto;
import com.google.gson.Gson;

@Service
public class MoiveService {
	
	private ModelAndView mav;
	
	@Autowired
	private MovieDao movdao;
	
	public ModelAndView movieReservation() {
		System.out.println("MoviceService.movieReservation() ");
		mav = new ModelAndView();
		
		//영화 목록 조회
		ArrayList<MovieDto> movieList = movdao.selectmovieList();
		System.out.println(movieList);
		
		mav.addObject("movieList", movieList);
		
		mav.setViewName("movie/MovieReservation");
		
		return mav;
	}

	public String getTheaterList(String movcode) {
		System.out.println("MovieService.getTheaterList()");
		
		//선택한 영화를 상영하는 영화관 목록 조회
		ArrayList<TheaterDto> theaterList = movdao.selectTheaterList(movcode);

		System.out.println(theaterList);

		//JSON으로 변환
		Gson gson = new Gson();
		String json_theaterList = gson.toJson(theaterList);
		System.out.println("변환 후 ");
		System.out.println(json_theaterList);
	
		
		return json_theaterList;
	}
	
	//상영 날짜 조회
	public String getScDateList(String movcode, String thcode) {
		System.out.println("MovieService.getScDateList()");
		
		ArrayList<ScheduleDto> ScDateList = movdao.selectScDateList(movcode, thcode);
		Gson gson = new Gson();
		String json_ScDateList = gson.toJson(ScDateList);
		System.out.println(json_ScDateList);
		
		return json_ScDateList;

	}

	public String getScHallTimeList(String movcode, String thcode, String scDate) {
		System.out.println("MovieServcie.getScHallTimeList()");
		
		ArrayList<ScheduleDto> ScHallTimeList = movdao.selectScHallTimeList(movcode, thcode, scDate);
		Gson gson = new Gson();
		String json_ScHallTimeList = gson.toJson(ScHallTimeList);
		System.out.println(json_ScHallTimeList);
		
		return json_ScHallTimeList;
	}

	public ModelAndView reserveMoive(ReservationDto reserve) {
		System.out.println("MovieServcie.reserveMovie()");
		
		//1.예매 코드 생성
		/* 
		 * 예매 코드 형식 'RE01 ~ RE99'
		 * 'RE23' >> 'RE' , '01'(String) >> 1(int) + 1 = 2
		 * */
		//예매 코드의 최대값 조회
		String maxRecode = movdao.selectMaxRecode();
		System.out.println(maxRecode);
		
		String recode = "";
		
		if(maxRecode == null) {
			recode = "RE01";
		}else {
			maxRecode = maxRecode.substring(2);
			System.out.println("maxRecode.substring(2 :" + maxRecode);
			int reNum = Integer.parseInt(maxRecode) + 1;
			System.out.println("reNum : " + reNum);
			if(reNum < 10) {
				recode = "RE0" + reNum;
			}else {
				recode = "RE" + reNum;
			}
		}
		
		System.out.println(recode);
		reserve.setRecode(recode);
		
		//Reservation 테이블에 insert
		
		mav = new ModelAndView();
		
		int insertResult = movdao.insertReserveMovie(reserve);
		
		mav.setViewName("home");
		
		return mav;
	}

	public ModelAndView moviereserveList(String remid) {
		System.out.println("MovieService.moviereservList()");
		mav = new ModelAndView();
		
		ArrayList<ReserveInfoDto> reserveList = movdao.selectReserveList(remid);
		System.out.println(reserveList);
		
		for(int i = 0; i < reserveList.size(); i++) {
			String recode = reserveList.get(i).getRecode();
			String mc_recode = movdao.selectMcRecode(recode);
			System.out.println(mc_recode);
			reserveList.get(i).setMc_recode(mc_recode);
		}
		
		System.out.println(reserveList);
		
		mav.addObject("reserveList", reserveList);
		
		mav.setViewName("movie/MovieReserveList");
		
		return mav;
	}

	public ModelAndView movieInfo(String movcode) {
		System.out.println("MovieService.movieInfo()");
		mav = new ModelAndView();
		
		MovieDto movieInfo = movdao.selectMovieInfo(movcode);
		
		//관람평목록
		ArrayList<MovieCommentDto> mvcommentList = movdao.selectCommentList(movcode);
		mav.addObject("mvcommentList",mvcommentList);
		
		mav.addObject("movieInfo", movieInfo);
		mav.setViewName("movie/MovieInfo");
		return mav;
	}

	public ModelAndView movieList() {
		System.out.println("MovieService.movieList()");
		mav = new ModelAndView();
		
		ArrayList<MovieDto> movieList = movdao.selectmovieList();
		
		int totalReserveCount = movdao.selectTotalReserveCount();
		
		//예매율
		for(int i = 0; i < movieList.size(); i++) {
			String movcode = movieList.get(i).getMovcode();
			int advanceReserveCount = movdao.selectAdvanceReserveCount(movcode);
			int advance = 0;
				if(totalReserveCount > 0) {
					advance = (int) ((double)advanceReserveCount/totalReserveCount * 100);
				}
				movieList.get(i).setAdvance(advance);
		}
	
		
		//추천율
		for(int i = 0; i < movieList.size(); i++) {
			String movcode = movieList.get(i).getMovcode();
			int totalComment = movdao.selectTotalCommentCount(movcode);
			int goodRecommend = movdao.selectGoodRecommend(movcode);
			int goodRatio = 0;
				if(totalComment > 0) {
					goodRatio = (int) ((double)goodRecommend/totalComment * 100);
				}
				movieList.get(i).setGoodRatio(goodRatio);
		}
		
		
		mav.addObject("movieList", movieList);
		mav.setViewName("movie/MovieList");
		
		return mav;
	}

	public ModelAndView reserveCancel(String recode) {
		System.out.println("MovieService.reserveCancel()");
		mav = new ModelAndView();
		
		int reserveDelete = movdao.reserveCancel(recode);
		
		
		mav.setViewName("home");
		
		return mav;
	}

	public ModelAndView movieCommentForm(String recode) {
		System.out.println("MovieService.movieCommentForm()");
		mav = new ModelAndView();
		
		CommentDto movieComment = movdao.selectMovieComment(recode);
		
		
		System.out.println("movieComment : " + movieComment);
		
		mav.addObject("movieComment", movieComment);
		mav.setViewName("movie/MovieCommentForm");
		
		return mav;
	}


	public ModelAndView movieCommentWrite(MovieCommentDto comment) {
		System.out.println("MovieService.movieCommentWrite()");
		mav = new ModelAndView();
		
		int CommentWrite = movdao.insertCommentWrite(comment);
		System.out.println("CommentWrite : " + CommentWrite);
		
		
		mav.setViewName("redirect:/moviereserveList?remid="+comment.getMc_mid());
		
		return mav;
	}

	public ModelAndView movieCommentView(String mc_recode) {
			System.out.println("MovieService.MovieCommentView()");
			mav = new ModelAndView();
			
			ReserveInfoDto reserveInfo = movdao.selectReserveInfo(mc_recode);
			System.out.println(reserveInfo);
			MovieCommentDto mvComment = movdao.selectMvComment(mc_recode);
			System.out.println(mvComment);
			
			mav.addObject("reserveInfo", reserveInfo);
			
			mav.addObject("mvComment", mvComment);
			
			mav.setViewName("movie/MovieCommentView");
			return mav;
		}

	public ModelAndView searchMovie(String movieSearch) {
		System.out.println("MovieService.searchMovie()");
		mav = new ModelAndView();
		
		ArrayList<MovieDto> searchMov = movdao.selectmovieSearch(movieSearch);
		System.out.println(searchMov);
		
		mav.addObject("searchMov", searchMov);
		mav.setViewName("movie/SearchMovie");
		
		return mav;
	}




}
