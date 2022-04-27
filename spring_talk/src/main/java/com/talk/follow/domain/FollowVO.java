package com.talk.follow.domain;

import lombok.Data;

@Data
public class FollowVO {
	
	private String follower;
	private String followed;
	private char favorite;
}
