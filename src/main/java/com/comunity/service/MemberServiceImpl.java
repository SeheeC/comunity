package com.comunity.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.comunity.domain.MemberVO;
import com.comunity.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MemberServiceImpl implements MemberService {
	
	@Setter(onMethod_=@Autowired)
	private MemberMapper mapper;
	
	@Override
	public int join(MemberVO vo) {
		
		return mapper.join(vo);
	}

	@Override
	public String checkID(String user_id) {
		
		return mapper.checkID(user_id);
	}

	@Override
	public MemberVO login(String user_id) {
		// TODO Auto-generated method stub
		return mapper.login(user_id);
	}

	@Override
	public int modify(MemberVO vo) {
		// TODO Auto-generated method stub
		return mapper.modify(vo);
	}

	@Override
	public int regDelete(String user_id, String user_pw) {
		// TODO Auto-generated method stub
		
		int count = 0;
		
		if(user_pw.equals(mapper.currentPwConfirm(user_id))) {
			count = mapper.regDelete(user_id);
		}
		
		return count;
	}
	
	
}
