
package com.MovieProject01.dao;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.MovieProject01.dto.MemberDto;

public interface MemberDao {


	int insertMember(MemberDto member);

	@Select("SELECT MID FROM MEMBERS WHERE MID = #{userInputId}")
	String checkMemberId(String userInputId);


	MemberDto loginMember(@Param("mid") String mid, @Param("mpw") String mpw);

	MemberDto memberView(String mid);

}
