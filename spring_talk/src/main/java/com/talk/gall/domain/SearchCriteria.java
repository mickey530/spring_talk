package com.talk.gall.domain;

import lombok.Data;

@Data
public class SearchCriteria extends Criteria {
	private String gall_name;
	
	
	private String searchType;
	private String keyword;
}
