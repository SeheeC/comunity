package com.comunity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.comunity.domain.PostVO;
import com.comunity.service.PostService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/board/*")
@Controller
@AllArgsConstructor
public class BoardController {
	
	private PostService service;
	
	// 글 작성 폼
	@GetMapping("/write")
	public void write() {
		
	}
	
	// 글 작성 저장
	@PostMapping("/write")
	public String write(PostVO post, RedirectAttributes rttr) {
		
		return "redirect:/post/list";
	}
	
}
