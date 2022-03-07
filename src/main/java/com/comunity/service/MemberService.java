package com.comunity.service;

import com.comunity.domain.MemberVO;

public interface MemberService {
	
	public int join(MemberVO vo);
	
	public String checkID(String user_id);

	public MemberVO login(String user_id);

	public int modify(MemberVO vo);

	public int regDelete(String user_id, String user_pw);

	public int changePw(String user_email, String user_pw);
	
	public String currentPwConfirm(String user_id, String cur_userPw, String cng_userPw);

	
}
