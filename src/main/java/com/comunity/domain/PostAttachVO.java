package com.comunity.domain;

import lombok.Data;

@Data
public class PostAttachVO {
	// 첨부 파일
	
	private String uuid;
	private String uploadPath;
	private String fileName;
	private String fileType;
	
	private Long bno;
	
}
