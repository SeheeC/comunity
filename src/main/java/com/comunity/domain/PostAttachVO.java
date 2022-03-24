package com.comunity.domain;

import lombok.Data;

@Data
public class PostAttachVO {
	// 첨부 파일
	
	private String pa_uuid;
	private String pa_uploadPath;
	private String pa_fileName;
	private String pa_fileType;
	
	private Long pa_bno;
	
}
