package com.talk.user.domain;

import com.talk.post.domain.Criteria;

import lombok.Data;

@Data
public class NoteCriteria extends Criteria{
	private String note_sender;
	private String note_recipient;
}
