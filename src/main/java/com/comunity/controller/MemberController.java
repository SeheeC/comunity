package com.comunity.controller;

import javax.inject.Inject;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.comunity.domain.EmailDTO;
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
	
	@Inject
	private JavaMailSender mailSender;
	
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
	@ResponseBody
	@GetMapping("/sendMailCode")
	public ResponseEntity<String> sendEmailCode(@RequestParam("user_email") String user_email, HttpSession session){
		
		ResponseEntity<String> entity = null;
		
		String emailCode = makeEmailCode();
		session.setAttribute("emailCode", emailCode);
		
		// 인증 code를 session에 임시 저장
		EmailDTO dto = new EmailDTO("Jogak", "seeh0908@gmail.com", user_email, "Jogak Comunity 메일 인증 Cdoe", emailCode);
		
		// 메일 내용 구성하는 class
		MimeMessage emailMessage = mailSender.createMimeMessage();
		
		try {
			emailMessage.addRecipient(RecipientType.TO, new InternetAddress(user_email));
			
			emailMessage.addFrom(new InternetAddress[] {new InternetAddress(dto.getSender_email(), dto.getSender_name())});
			
			emailMessage.setSubject(dto.getEmail_title(), "UTF-8");
			
			emailMessage.setText(dto.getEmail_code(), "UTF-8");
			
			mailSender.send(emailMessage);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	// 메일 인증 코드 생성
	private String makeEmailCode() {
		
		String emailCode = "";
		
		for(int i=0; i<6; i++) {
			emailCode += String.valueOf((int) (Math.random() * 9) + 1);
		}
		
		return emailCode;
	}
	
	// 메일 인증 요청 확인
	@ResponseBody
	@GetMapping("/emailConfirm")
	public ResponseEntity<String> emailConfirm(@RequestParam("userEmailCode") String userEmailCode, HttpSession session){
		
		ResponseEntity<String> entity = null;
		
		String emailCode = (String) session.getAttribute("emailCode");
		
		if(emailCode.equals(userEmailCode)) {
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}else {
			entity = new ResponseEntity<String>("fail", HttpStatus.OK);
		}
		
		return entity;
	}
	
	
}
