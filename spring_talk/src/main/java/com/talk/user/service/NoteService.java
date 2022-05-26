package com.talk.user.service;


import java.util.List;

import com.talk.user.domain.NoteVO;


public interface NoteService {
	
	public List<NoteVO> getList(NoteVO vo);

	public NoteVO select(NoteVO vo);
	
	public void insert(NoteVO vo);
	
	public void delete(long note_num);
	
}
