package com.talk.user.domain;

import lombok.Data;

@Data
public class UserVO {
	
	// board_tbl 구조에 맞게 멤버변수를 선언해주세요.
	private long user_num; 
	private String user_id;
	private String user_pw;
	private String user_name;
	private String last_name;
	private String user_age;
	private String phone_num;
}
