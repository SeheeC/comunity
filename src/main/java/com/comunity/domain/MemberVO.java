package com.comunity.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	
	private String user_id;
	private String user_nm;
	private String user_nick;
	private String user_pw;
	private Long addr_no;
	private String addr_front;
	private String addr_back;
	private String phone_no;
	private String email_chk;
	private Date reg_date;
	private Long my_post;
	private Long my_cmt;
	private Long my_itr;
	
}
