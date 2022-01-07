package com.MovieProject01.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.MovieProject01.dto.CommentDto;
import com.MovieProject01.dto.MovieCommentDto;
import com.MovieProject01.dto.MovieDto;
import com.MovieProject01.dto.ReservationDto;
import com.MovieProject01.dto.ReserveInfoDto;
import com.MovieProject01.dto.ScheduleDto;
import com.MovieProject01.dto.TheaterDto;


public interface MovieDao {

	
	ArrayList<MovieDto> selectmovieList();

	
	ArrayList<TheaterDto> selectTheaterList(String movcode);


	ArrayList<ScheduleDto> selectScDateList(@Param("movcode")String movcode, @Param("thcode")String thcode);


	ArrayList<ScheduleDto> selectScHallTimeList(@Param("movcode")String movcode, @Param("thcode")String thcode, @Param("scDate")String scDate);


	String selectMaxRecode();


	int insertReserveMovie(ReservationDto reserve);

	
	ArrayList<ReserveInfoDto> selectReserveList(String remid);

	
	MovieDto selectMovieInfo(String movcode);


	int reserveCancel(String movcode);


	CommentDto selectMovieComment(String recode);


	int insertCommentWrite(MovieCommentDto comment);


	ArrayList<MovieCommentDto> selectCommentList(String movcode);


	String selectMcRecode(String recode);


	ReserveInfoDto selectReserveInfo(String mc_recode);


	MovieCommentDto selectMvComment(String mc_recode);


	int selectTotalCommentCount(String movcode);


	int selectGoodRecommend(String movcode);


	int selectTotalReserveCount();


	int selectAdvanceReserveCount(String movcode);


	ArrayList<MovieDto> selectmovieSearch(String movieSearch);



}
