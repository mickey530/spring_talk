package com.talk.user.domain;

import java.util.List;

import lombok.Data;

@Data
public class UserAuthVO {

	private UserVO uvo;
	private List<AuthVO> avos;
}
