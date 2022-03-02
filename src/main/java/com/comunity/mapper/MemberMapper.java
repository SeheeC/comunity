package com.comunity.mapper;

import com.comunity.domain.MemberVO;

public interface MemberMapper {
	
	public int join(MemberVO vo);

	public String checkID(String user_id);

	public MemberVO login(String user_id);
	
	public void index();

	public int modify(MemberVO vo);

	public int regDelete(String user_id);

	public String currentPwConfirm(String user_id);
	
}
