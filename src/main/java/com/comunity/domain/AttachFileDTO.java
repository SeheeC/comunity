package com.comunity.domain;

import lombok.Data;

// 파일업로드 연습용
@Data
public class AttachFileDTO {

	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean image;
}
