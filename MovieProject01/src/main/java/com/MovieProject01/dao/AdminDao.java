package com.MovieProject01.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.MovieProject01.dto.MemberDto;
import com.MovieProject01.dto.MovieDto;
import com.MovieProject01.dto.ReserveInfoDto;
import com.MovieProject01.dto.ScheduleDto;
import com.MovieProject01.dto.TheaterDto;

public interface AdminDao {


	ArrayList<MemberDto> selectMemberList();

	int updateMemberModify(MemberDto memberInfo);

	ArrayList<ReserveInfoDto> selectMemberReserveList(String remid);

	ArrayList<MovieDto> selectMovieList();

	int updateMovieModify(MovieDto movieInfo);

	int insertMovie(MovieDto movie);

	String selectMaxMovcode();

	int updateMovieState(@Param("movcode") String movcode, @Param("movstate") int movstate);

	ArrayList<TheaterDto> selecttheaterList();

	int updateTheaterInfo(TheaterDto theaterInfo);

	int updateThstate(@Param("thcode")String thcode, @Param("thstate")int thstate);

	String selectMaxThcode();

	int insertTheater(TheaterDto theater);

	ArrayList<TheaterDto> selectTheaterList();

	ArrayList<ScheduleDto> selectThScList(@Param("scthcode") String scthcode, @Param("scdate") String scdate);

	int insertSchedule(ScheduleDto schedule);







}
