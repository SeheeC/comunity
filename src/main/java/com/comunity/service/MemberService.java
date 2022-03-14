package com.comunity.service;

import com.comunity.domain.MemberVO;

public interface MemberService {
	
	public int join(MemberVO vo);
	
	public String checkID(String user_id);

	public MemberVO login(String user_id);
	
	public String searchId(String user_nm, String user_email);
	
	public String searchPw(String user_id, String user_nm, String user_email);

	public int modify(MemberVO vo);

	public int regDelete(String user_id, String user_pw);

	public int changePw(String user_id, String user_pw);
	
	public String currentPwConfirm(String user_id, String cur_userPw, String cng_userPw);

	
}
