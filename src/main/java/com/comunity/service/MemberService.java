package com.comunity.service;

import com.comunity.domain.MemberVO;

public interface MemberService {
	
	public int join(MemberVO vo);
	
	public String checkID(String user_id);

	public MemberVO login(String user_id);

	public int modify(MemberVO vo);

	public int regDelete(String user_id, String user_pw);

	
}
