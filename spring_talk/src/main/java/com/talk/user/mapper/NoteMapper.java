package com.talk.user.mapper;

import java.util.List;

import com.talk.user.domain.NoteCriteria;
import com.talk.user.domain.NoteVO;

public interface NoteMapper {
	
	public List<NoteVO> getList(NoteCriteria cri);
	
	// insert
	public void insert(NoteVO vo);
	
	// select
	public NoteVO select(NoteVO vo);
	
	// delete
	public void delete(long note_num);
	
	
	
	
	

}
