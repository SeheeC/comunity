package com.comunity.mapper;

import com.comunity.domain.MemberVO;

public interface MemberMapper {
	
	public int join(MemberVO vo);

	public String checkID(String user_id);
	
}
