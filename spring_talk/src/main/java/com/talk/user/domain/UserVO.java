package com.talk.user.domain;

import java.util.List;

import lombok.Data;

@Data
public class UserVO {
	
	private long user_num = 0; 
	private String user_id = "";
	private String user_pw = "";
	private String user_name = "";
	private String last_name = "";
	private String user_age = "";
	private String phone_num = "";
	private String user_comment = "";
	private byte[] user_img ;
	private List<AuthVO> avos ;
}
