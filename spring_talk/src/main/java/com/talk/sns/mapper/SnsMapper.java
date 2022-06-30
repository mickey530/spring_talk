package com.talk.sns.mapper;

import java.util.List;
import com.talk.sns.domain.SnsVO;

public interface SnsMapper {

	public List<SnsVO> getAllData(String addr);

}
