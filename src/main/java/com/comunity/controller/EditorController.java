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
@RequestMapping("/editor/*")
@Controller
@AllArgsConstructor
public class EditorController {
	
	private PostService service;
	
	// editor 폼
	@GetMapping("/")
	public void editor() {
		
	}
	
	// file upload
	@PostMapping("/imageUpload")
	public void imageUpload(PostVO post, RedirectAttributes rttr) {
		
	}
	
}
