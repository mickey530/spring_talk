package com.talk.user.mapper;

import java.util.List;

import com.talk.user.domain.NoteVO;

public interface NoteMapper {
	
	public List<NoteVO> getList();
	
	// insert
	public void insert(NoteVO vo);
	
	// select
	public NoteVO select(long note_num);
	
	// delete
	public void delete(long note_num);
	
	
	
	
	

}
