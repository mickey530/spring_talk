package com.talk.user.service;


import java.util.List;

import com.talk.user.domain.NoteVO;


public interface NoteService {
	
	public List<NoteVO> getList();

	public NoteVO select(long note_num);
	
	public void insert(NoteVO vo);
	
	public void delete(long note_num);
	
}
