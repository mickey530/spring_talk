package com.talk.user.domain;

import lombok.Data;

@Data
public class FriendBookVO {
	
	private String book_owner;
	private String friend;
	private String book_comment;
}
