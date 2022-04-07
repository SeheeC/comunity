package com.comunity.mapper;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import com.comunity.domain.Criteria;
import com.comunity.domain.PostVO;

public interface PostMapper {
	
	public void insert(PostVO post);
	
	public List<PostVO> getList();
	
	public PostVO get(@RequestParam("pst_no") Long pst_no);
	
	public int update(PostVO post);
	
	public int delete(Long pst_no);

	public List<PostVO> getListWithPaging(Criteria cri);

	public int getTotalCount(Criteria cri);
	
}
