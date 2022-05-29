package com.talk.post.domain;

import java.sql.Date;
import java.util.List;

import com.talk.file.domain.ImageFileVO;

import lombok.Data;

@Data
public class PostDTO {
	private PostVO postVO;
	private List<ImageFileVO> ifVOs;
}
