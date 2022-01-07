package com.MovieProject01.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.MovieProject01.dao.AdminDao;
import com.MovieProject01.dto.MemberDto;
import com.MovieProject01.dto.MovieDto;
import com.MovieProject01.dto.ReserveInfoDto;
import com.MovieProject01.dto.ScheduleDto;
import com.MovieProject01.dto.TheaterDto;
import com.google.gson.Gson;

	

@Service
public class AdminService {
	
	@Autowired
	private AdminDao adminDao;

	private ModelAndView mav;
	
	
	
	private String savePath = "C:\\Spring_workspace\\MovieProject01\\src\\main\\webapp\\resources\\poster";
	
	
	public ModelAndView Admin_memberList() {
		System.out.println("AdminService.Admin_memberList()");
		
		mav = new ModelAndView();
		
		ArrayList<MemberDto> memberList = adminDao.selectMemberList();
		
		mav.addObject("memberList", memberList);
		
		mav.setViewName("admin/Admin_MemberList");
		
		return mav;
	}




	public ModelAndView Admin_MemberModify(MemberDto memberInfo, RedirectAttributes ra) {
		System.out.println("AdminService.admin_MemberModify()");
		
		mav = new ModelAndView();
		
		int updateResult = adminDao.updateMemberModify(memberInfo);
		
		if(updateResult > 0) {
			ra.addFlashAttribute("modifyMsg", memberInfo.getMid()+" 회원의 정보를 수정하였습니다.");
		} else {
			ra.addFlashAttribute("modifyMsg", memberInfo.getMid()+" 회원의 정보수정에 실패하였습니다.");	
		}
		
		mav.setViewName("redirect:/Admin_memberList");
		
		return mav;
	}



	public String Admin_getMemberReserveList(String remid) {
		System.out.println("AdminService.Admin_getMemberReserveList()");
		
		ArrayList<ReserveInfoDto> reserveList = adminDao.selectMemberReserveList(remid);
		
		Gson gson = new Gson();
		String reserveList_Json = gson.toJson(reserveList);
		
		return reserveList_Json;
	}




	public ModelAndView Admin_MovieList() {
		System.out.println("AdminService.Admin_MovieList()");
		
		mav = new ModelAndView();
		
		ArrayList<MovieDto> movieList = adminDao.selectMovieList();
		
		mav.addObject("movieList", movieList);
		
		mav.setViewName("admin/Admin_MovieList");
		
		return mav;
	}




	public ModelAndView Admin_MovieModify(MovieDto movieInfo, RedirectAttributes ra) {
		System.out.println("AdminService.Admin_MovieModify()");
		
		mav = new ModelAndView();
		
		int updateResult = adminDao.updateMovieModify(movieInfo);
			
		if(updateResult > 0) {
			ra.addFlashAttribute("modifyMsg", movieInfo.getMovname()+" 영화 정보를 수정하였습니다.");
		} else {
			ra.addFlashAttribute("modifyMsg", movieInfo.getMovname()+" 영화 정보 수정에 실패하였습니다.");
		}
		
		mav.setViewName("redirect:/Admin_MovieList");
		
		return mav;
	}
	
	




	public ModelAndView Admin_MovieRegist(MovieDto movie) throws IllegalStateException, IOException {
		System.out.println("AdminService.Admin.MovieRegist()");
		mav = new ModelAndView();
		
		//프로필 파일 첨부 확인
		MultipartFile pfile = movie.getPfile();
		String movposter = "";
		if(!pfile.isEmpty()) {
			UUID uuid = UUID.randomUUID();
			movposter = uuid.toString()+"_"+pfile.getOriginalFilename();
			//프로필 파일 저장
			pfile.transferTo( new File(savePath, movposter) );
			}
		
		movie.setMovposter(movposter);
		
		//1.영화 코드 생성
				/* 
				 * 영화 코드 형식 'RE01 ~ RE99'
				 * 'RE23' >> 'RE' , '01'(String) >> 1(int) + 1 = 2
				 * */
				//영화 코드의 최대값 조회
				String maxMovcode = adminDao.selectMaxMovcode();
				System.out.println(maxMovcode);
				
				String movcode = "";
				
				if(maxMovcode == null) {
					movcode = "MV01";
				}else {
					maxMovcode = maxMovcode.substring(2);
					System.out.println("maxMovcode.substring(2 :" + maxMovcode);
					int mvNum = Integer.parseInt(maxMovcode) + 1;
					System.out.println("mvNum : " + mvNum);
					if(mvNum < 10) {
						movcode = "MV0" + mvNum;
					}else {
						movcode = "MV" + mvNum;
					}
				}
				
				System.out.println(movcode);
				movie.setMovcode(movcode);
		
		
		int insertRegist = adminDao.insertMovie(movie);
		System.out.println("영화등록결과 : " + insertRegist);
		
		mav.setViewName("redirect:/Admin_MovieList");

		return mav;
	}




	public ModelAndView Admin_MovState(String movcode, int movstate) {
		System.out.println("AdminService.Admin_MovState()");
		
		mav = new ModelAndView();
		
		int updateResult = adminDao.updateMovieState(movcode, movstate);
		
		mav.setViewName("redirect:/Admin_MovieList");
		
		return mav;
	}




	public ModelAndView Admin_TheaterList() {
		System.out.println("AdminService.AdminTheaterList()");
		mav = new ModelAndView();
		
		ArrayList<TheaterDto> theaterList = adminDao.selecttheaterList();
		
		mav.addObject("theaterList", theaterList);
		
		mav.setViewName("admin/Admin_TheaterList");
		
		return mav;
	}


	public ModelAndView Admin_TheaterModify(TheaterDto theaterInfo, RedirectAttributes ra) {
		System.out.println("AdminService.Admin_TheaterModify()");
		
		mav = new ModelAndView();
		
		int updateResult = adminDao.updateTheaterInfo(theaterInfo);
		
		if(updateResult > 0) {
			ra.addFlashAttribute("modifyMsg", theaterInfo.getThname()+"의 정보를 수정하였습니다.");
		} else {
			ra.addFlashAttribute("modifyMsg", theaterInfo.getThname()+"의 정보 수정에 실패하였습니다.");	
		}
		
		mav.setViewName("redirect:/Admin_TheaterList");
		
		return mav;
	}


	public ModelAndView Admin_ThState(String thcode, int thstate) {
		System.out.println("AdminService.Admin_ThState()");
		
		mav = new ModelAndView();
		
		int updateResult = adminDao.updateThstate(thcode, thstate);
		
		mav.setViewName("redirect:/Admin_TheaterList");
		
		return mav;
	}




	public ModelAndView Admin_TheaterRegist(TheaterDto theater) {
		System.out.println("AdminService.Admin_TheaterRegist()");
		mav = new ModelAndView();
		
		//1.영화관 코드 생성
		/* 
		 * 영화관 코드 형식 'TH01 ~ TH99'
		 * 'TH23' >> 'TH' , '01'(String) >> 1(int) + 1 = 2
		 * */
		//영화관 코드의 최대값 조회
		String maxThcode = adminDao.selectMaxThcode();
		System.out.println(maxThcode);
		
		String thcode = "";
		
		if(maxThcode == null) {
			thcode = "TH01";
		}else {
			maxThcode = maxThcode.substring(2);
			System.out.println("maxThcode.substring(2 :" + maxThcode);
			int thNum = Integer.parseInt(maxThcode) + 1;
			System.out.println("thNum : " + thNum);
			if(thNum < 10) {
				thcode = "TH0" + thNum;
			}else {
				thcode = "TH" + thNum;
			}
		}
		
		System.out.println(thcode);
		theater.setThcode(thcode);


		int insertRegist = adminDao.insertTheater(theater);
		System.out.println("영화관등록결과 : " + insertRegist);
		
		mav.setViewName("redirect:/Admin_TheaterList");
		
		return mav;
	}




	public ModelAndView Admin_ScheduleRegistForm() {
		System.out.println("AdminService.Admin_ScheduleRegistForm");
		
		mav = new ModelAndView();
		
		ArrayList<MovieDto> movieList = adminDao.selectMovieList();
		mav.addObject("movieList", movieList);
		
		ArrayList<TheaterDto> theaterList  = adminDao.selectTheaterList();
		mav.addObject("theaterList", theaterList);
		
		
		mav.setViewName("admin/Admin_ScheduleRegistForm");
		return mav;
	}




	public String getTheaterScheduleList(String scthcode, String scdate) {
		System.out.println("AdminService.getTheaterScheduleList()");
		
		ArrayList<ScheduleDto> theaterScheduleList = adminDao.selectThScList(scthcode, scdate);
		
		Gson gson = new Gson();
		String theaterScheduleList_json = gson.toJson(theaterScheduleList);
		
		return theaterScheduleList_json;
	}

	
	public ModelAndView Admin_ScheduleRegist(ScheduleDto schedule) {
		System.out.println("AdminService.Admin_ScheduleRegist()");
		mav = new ModelAndView();

		String[] scHallTimeArr = schedule.getScHallTimeArr();
		for(int i = 0; i < scHallTimeArr.length; i++) {
			String schall = scHallTimeArr[i].split(" ")[0];
			String sctime = schedule.getScdate()+" "+ scHallTimeArr[i].split(" ")[1];
			schedule.setSchall(schall);
			schedule.setSctime(sctime);
			System.out.println(schedule);
			
			int insertResult = adminDao.insertSchedule(schedule);
		}
		
		mav.setViewName("admin/Admin_home");
		return mav;
	}







}
