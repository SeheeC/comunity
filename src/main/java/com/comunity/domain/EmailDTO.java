package com.comunity.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class EmailDTO {
	private String sender_name;
	private String sender_email;
	private String receive_email;
	private String email_title;
	private String email_code;
}
