package com.comunity.service;

import java.util.List;

import com.comunity.domain.Criteria;
import com.comunity.domain.PostVO;

public interface PostService {
	
	public void write(PostVO vo);
	
	public List<PostVO> getList();
	
	public List<PostVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	public PostVO get(Long pst_no);
	
	public void modify(PostVO post);
	
	public void delete(Long pst_no);
	
	
}
