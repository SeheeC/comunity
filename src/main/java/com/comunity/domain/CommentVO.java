package com.comunity.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CommentVO {

	private Long rno;
	private Long pst_no;
	private String cmt_writer;
	private Date cmt_date;
	private String cmt_content;
	private Long cmt_hit;
	
}
