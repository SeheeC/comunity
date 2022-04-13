package com.comunity.mapper;

import java.util.List;

import com.comunity.domain.PostAttachVO;

public interface PostAttachMapper {

	public void insert(PostAttachVO vo);
	
	public List<PostAttachVO> findByBno(Long bno);
	
	// 개별 삭제(게시물 수정 시 파일삭제)
	public void delete(String uuid);
	
	//게시물 번호에 해당하는 삭제
	public void deleteAll(Long bno);
	
	// 하루 전의 파일 정보 목록
	public List<PostAttachVO> getOldFiles();
}
