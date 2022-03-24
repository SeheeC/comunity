package com.comunity.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class PostVO {
	private Long pst_no;
	private String pst_title;
	private String pst_writer;
	private Date pst_wr_date;
	private Date pst_update_date;
	private String pst_content;
	private Long pst_hit;
	private Long pst_itr;
	private Long pst_cmt_cnt;
	private String pst_thum_img;
	
	private int post_cnt;
	private int cmt_cnt;
	private int inr_cnt;
	
	// 첨부 파일 정보
	private List<PostAttachVO> attachList;
	
}
