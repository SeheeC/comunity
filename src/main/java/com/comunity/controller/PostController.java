package com.comunity.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.comunity.domain.Criteria;
import com.comunity.domain.PageDTO;
import com.comunity.domain.PostVO;
import com.comunity.service.PostService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/post/*")
@Controller
@AllArgsConstructor
public class PostController {
	
	private PostService service;
	
	// 글 작성 폼
	@GetMapping("/write")
	public void write() {
		
	}
	
	// 글 작성 저장
	@PostMapping("/write")
	
	public String write(PostVO post, RedirectAttributes rttr) {
		
		if(post.getAttachList() != null) {
			post.getAttachList().forEach(attach -> log.info(attach));
		}
		
		service.write(post);
		
		return "redirect:/post/list";
	}
	
	
	// 게시판 글 목록
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		
		// 1) list.jsp(view) 목록 data
		List<PostVO> list = service.getListWithPaging(cri);
		model.addAttribute("list", list);
		
		// list.jsp(view) paging
		int total = service.getTotalCount(cri);
		
		PageDTO pageDTO = new PageDTO(cri, total);
		model.addAttribute("pageMaker", pageDTO);
		
	}
	
	// 게시물 읽기, 수정 form
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("pst_no") Long pst_no, @ModelAttribute("cri") Criteria cri, Model model) {
		
		PostVO post = service.get(pst_no);
		model.addAttribute("post", post);
		
	}
	
	@PostMapping("/modify") 
	public String modify(PostVO post, Criteria cri, RedirectAttributes rttr) {
		
		service.modify(post);
		
		return "redirect:/post/list" + cri.getListLink();
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("pst_no") Long pst_no, Criteria cri, RedirectAttributes rttr) {
		
		service.delete(pst_no);

		return "redirect:/post/list" + cri.getListLink();
	}
	
}
