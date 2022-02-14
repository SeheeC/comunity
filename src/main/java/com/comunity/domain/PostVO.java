package com.comunity.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PostVO {
	private Long pst_no;
	private String pst_title;
	private String pst_writer;
	private Date pst_wr_date;
	private String pst_content;
	private Long pst_hit;
	private Long pst_itr;
	private Long pst_cmt_cnt;
	private String pst_thum_img;
}
