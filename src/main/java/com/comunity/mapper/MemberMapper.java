package com.comunity.mapper;

import org.apache.ibatis.annotations.Param;

import com.comunity.domain.MemberVO;

public interface MemberMapper {
	
	public int join(MemberVO vo);

	public String checkID(String user_id);

	public MemberVO login(String user_id);
	
	public String searchId(String user_id, String user_nm, String user_email);

	public String searchPw(String user_id, String user_nm, String user_email);
	
	public void index();

	public int modify(MemberVO vo);

	public int regDelete(String user_id);
	
	public int changePw(@Param("user_email") String user_email, @Param("user_pw") String user_pw);

	public String currentPwConfirm(String user_id);
	
	public int changeNewPw(@Param("user_id") String user_id, @Param("cng_userPw") String cng_userPw);

	
}
