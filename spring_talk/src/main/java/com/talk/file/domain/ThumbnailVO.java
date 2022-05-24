package com.talk.file.domain;

import java.util.List;

import lombok.Data;

@Data
public class ThumbnailVO {

    private long img_num;
	private String file_name;
	private String uuid;
	private String upload_path;
}
