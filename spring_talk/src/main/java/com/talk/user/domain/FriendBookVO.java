package com.talk.user.domain;

import lombok.Data;

@Data
public class FriendBookVO {

	private long book_num;
	private String book_owner;
	private String friend;
	private String book_comment;
}
