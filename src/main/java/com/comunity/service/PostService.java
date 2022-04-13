package com.comunity.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.comunity.domain.Criteria;
import com.comunity.domain.PostAttachVO;
import com.comunity.domain.PostVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

public interface PostService {
	
	public void write(PostVO vo);
	
	public List<PostVO> getList();
	
	public List<PostVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	public PostVO get(Long pst_no);
	
	public void modify(PostVO post);
	
	public void delete(Long pst_no);
	
	// file 첨부 목록
	public List<PostAttachVO> getAttachList(Long img_bno);
	
	// 게시물에 해당하는 첨부file 정보 삭제
	public void removeAttach(Long img_bno);
	
	
}
