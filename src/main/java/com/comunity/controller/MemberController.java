package com.comunity.controller;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.comunity.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@RequestMapping("/member/*")
@Controller
public class MemberController {
	
	@Inject
	private MemberService service;
	
	// 회원 가입 폼
	@GetMapping("/join")
	public void join() {
		
	}
	
	// 회원 가입 저장
	
	// 아이디 중복 체크
	@ResponseBody
	@GetMapping("/checkID")
	public ResponseEntity<String> checkID(@RequestParam("user_id") String user_id) throws Exception{
		
		String result = "";
		ResponseEntity<String> entity = null;
		
		result = StringUtils.isEmpty(service.checkID(user_id)) ? "Y" : "N";
		
		entity = new ResponseEntity<String>(result, HttpStatus.OK);
		
		return entity;
	}
	
	
	// 메일 인증 요청
	
	// 메일 인증 요청 확인
	
	// 메일 인증 요청 코드 생성.
	
}
