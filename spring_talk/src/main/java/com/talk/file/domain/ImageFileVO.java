package com.talk.file.domain;

import java.util.List;

import lombok.Data;

@Data
public class ImageFileVO {

    private long img_num;
    private long post_num;
	private String file_name;
	private String upload_path;
	private String uuid;
	private String file_type;
}
