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
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.comunity.domain.EmailDTO;
import com.comunity.domain.MemberVO;
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
	
	//////////////////////////////////////////////////////////////////// 회원 가입
	
	// 회원 가입 폼
	@GetMapping("/join")
	public void join() {
		
	}
	
	// 회원 가입 저장
	@PostMapping("/join")
	public String joinOk(MemberVO vo, RedirectAttributes rttr) throws Exception{
		
		vo.setEmail_chk(!StringUtils.isEmpty(vo.getEmail_chk()) ? "Y" : "N");
		
		service.join(vo);
		
		return "redirect:/member/login";
	}
	
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
			
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
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
	
	// 로그인
	@ResponseBody
	@PostMapping("/login")
	public ResponseEntity<String> login(@RequestParam("user_id") String user_id, @RequestParam("user_pw") String user_pw, HttpSession session)throws Exception{
		
		String result = "";
		ResponseEntity<String> entity = null;
		
		MemberVO vo = service.login(user_id);
		
		if(vo == null) {
			result = "idFail";
		}else{
			if(user_pw.equals(vo.getUser_pw())) {
				result = "success";
				session.setAttribute("loginStatus", vo);
			}else{
				result = "pwFail";
			}
		}
		
		entity = new ResponseEntity<String>(result, HttpStatus.OK);
		return entity;
	}
	
	// 로그인 폼
		@GetMapping("/login")
		public void login() {
			
		}
	
	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session, RedirectAttributes rttr) {
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	// 아이디 찾기 폼
	@GetMapping("/searchId")
	public void searchId() {
		
	}
	
	// 비밀번호 찾기 폼
	@GetMapping("/searchPw")
	public void searchPw() {
			
	}
	
	// 아이디 찾기
	@ResponseBody
	@PostMapping("/searchId")
	public ResponseEntity<String> searchId(MemberVO vo, @RequestParam("user_nm") String user_nm, @RequestParam("user_email") String user_email) {
		
		ResponseEntity<String> entity = null;
		
		String user_id = vo.getUser_id();
		
		if(!StringUtils.isEmpty(service.searchId(vo, user_nm, user_email))) {
			
			EmailDTO dto = new EmailDTO("Jogak", "shhh0009@gmail.com", user_email, "Jogak Comunity 가입 아이디", user_id);
			
			MimeMessage message = mailSender.createMimeMessage();
			
			try {
				
				message.addRecipient(RecipientType.TO, new InternetAddress(user_email));
				message.addFrom(new InternetAddress[] {new InternetAddress(dto.getSender_email(), dto.getSender_name())});
				message.setSubject(dto.getEmail_title(), "UTF-8");
				message.setText(dto.getEmail_code());
				
				mailSender.send(message);
				
				entity = new ResponseEntity<String>("success", HttpStatus.OK);
				
			}catch(Exception e) {
				
				e.printStackTrace();				
				entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
				
			}// try-catch 종료
			
		}else{
			
			entity = new ResponseEntity<String>("noNm", HttpStatus.OK);
			entity = new ResponseEntity<String>("noMail", HttpStatus.OK);
			
		}// if 종료
		
		return entity;
	}
	
	// 비밀번호 찾기
	@ResponseBody
	@PostMapping("/searchPw")
	public ResponseEntity<String> searchPw(@RequestParam("user_id") String user_id, @RequestParam("user_nm") String user_nm, @RequestParam("user_email") String user_email) {
			
		ResponseEntity<String> entity = null;
		
		if(!StringUtils.isEmpty(service.searchPw(user_id, user_nm, user_email))) {
		
			String tempPw = makeEmailCode();
			
			EmailDTO dto = new EmailDTO("Jogak", "shhh0009@gmail.com", user_email, "Jogak Comunity 임시 비밀번호", tempPw);
			
			MimeMessage message = mailSender.createMimeMessage();
			
			try {
				
				message.addRecipient(RecipientType.TO, new InternetAddress(user_email));
				message.addFrom(new InternetAddress[] {new InternetAddress(dto.getSender_email(), dto.getSender_name())});
				message.setSubject(dto.getEmail_title(), "UTF-8");
				message.setText(dto.getEmail_code());
				
				mailSender.send(message);
				
				String user_pw = tempPw;
				service.changePw(user_email, user_pw);
				
				entity = new ResponseEntity<String>("success", HttpStatus.OK);
				
			}catch(Exception e) {
				
				e.printStackTrace();				
				entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
				
			}// try-catch 종료
			
		}else{
			
			entity = new ResponseEntity<String>("noId", HttpStatus.OK);
			entity = new ResponseEntity<String>("noNm", HttpStatus.OK);
			entity = new ResponseEntity<String>("noMail", HttpStatus.OK);
			
		}// if 종료
		
		return entity;
	}
	
	
	//////////////////////////////////////////////////////////////////// 회원 수정

	// 회원 수정 폼
	@GetMapping(value = {"/modify", "/mypage"})
	public void modify(HttpSession session, Model model) {
		
		MemberVO vo = (MemberVO) session.getAttribute("loginStatus");
		
		String user_id = vo.getUser_id();
		
		model.addAttribute(service.login(user_id));
	}
	
	// 회원 수정 저장
	@PostMapping("/modify")
	public String modify(MemberVO vo, HttpSession session, RedirectAttributes rttr) {
		
		String redirectURL = "";
		
		vo.setEmail_chk(!StringUtils.isEmpty(vo.getEmail_chk()) ? "Y" : "N");
		
		MemberVO session_vo = (MemberVO) session.getAttribute("loginStatus");
		
		if(vo.getUser_pw().equals(session_vo.getUser_pw())) {
			service.modify(vo);
			
			redirectURL = "/";
			rttr.addFlashAttribute("msg", "modifyOk");
		}else{
			redirectURL = "/member/modify";
			rttr.addFlashAttribute("msg", "modifyFail");
		}
		
		return "redirect:" + redirectURL;
	}
	
	// 회원 탈퇴
	@ResponseBody
	@PostMapping("/regDelete")
	public ResponseEntity<String> regDelete(@RequestParam("user_pw") String user_pw, HttpSession session){
		
		ResponseEntity<String> entity = null;
		
		MemberVO vo = (MemberVO) session.getAttribute("loginStatus");
		
		String user_id = vo.getUser_id();
		
		entity = new ResponseEntity<String>(String.valueOf(service.regDelete(user_id, user_pw)), HttpStatus.OK);
		
		return entity;
	}
	
	// 비밀번호 변경
	@ResponseBody
	@PostMapping("/changePw")
	public ResponseEntity<String> changePw(@RequestParam("cur_userPw") String cur_userPw, @RequestParam("cng_userPw") String cng_userPw, HttpSession session){
		
		ResponseEntity<String> entity = null;
		
		MemberVO vo = (MemberVO) session.getAttribute("loginStatus");
		
		String user_id = vo.getUser_id();
		
		String result = service.currentPwConfirm(user_id, cur_userPw, cng_userPw);
		
		entity = new ResponseEntity<String>(result, HttpStatus.OK);
		
		return entity;
	}
	
	
	
}
