package com.comunity.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import com.comunity.domain.Criteria;
import com.comunity.domain.PostAttachVO;
import com.comunity.domain.PostVO;
import com.comunity.mapper.PostAttachMapper;
import com.comunity.mapper.PostMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class PostServiceImpl implements PostService {
	
	@Setter(onMethod_ = @Autowired)
	private PostMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private PostAttachMapper attachMapper;
	
	@Transactional
	@Override
	public void write(PostVO post) {
		
		mapper.insert(post);
	}
	
	@Override
	public PostVO get(Long pst_no) {
		// TODO Auto-generated method stub
		return mapper.get(pst_no);
	}
	
	@Override
	public List<PostVO> getList() {
		// TODO Auto-generated method stub
		return mapper.getList();
	}
	
	@Override
	public void modify(PostVO post) {
		// TODO Auto-generated method stub
		
		attachMapper.deleteAll(post.getPst_no());
		
		boolean modifyResult = mapper.update(post) == 1;
		
		if(modifyResult && post.getAttachList() != null && post.getAttachList().size() >= 0) {
			
			post.getAttachList().forEach(attach -> {
				
				attach.setBno(post.getPst_no());
				attachMapper.insert(attach);
				
			});
		}
	}
	
	@Override
	public void delete(Long pst_no) {
		// TODO Auto-generated method stub
		mapper.delete(pst_no);
	}

	@Override
	public List<PostVO> getListWithPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<PostAttachVO> getAttachList(Long bno) {
		// TODO Auto-generated method stub
		return attachMapper.findByBno(bno);
	}

	@Override
	public void removeAttach(Long bno) {
		// TODO Auto-generated method stub
		attachMapper.deleteAll(bno);
	}


}
