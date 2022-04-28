package com.talk.user.domain;

import lombok.Data;

@Data
public class FollowVO {
	
	private String follower;
	private String followed;
	private char favorite;
}
