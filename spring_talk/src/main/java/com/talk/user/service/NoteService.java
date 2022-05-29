package com.talk.user.service;


import java.util.List;

import com.talk.user.domain.NoteCriteria;
import com.talk.user.domain.NoteVO;


public interface NoteService {
	
	public List<NoteVO> getList(NoteCriteria cri);

	public NoteVO select(NoteVO vo);
	
	public void insert(NoteVO vo);
	
	public void delete(long note_num);

	public List<String> noteUserList(String login_id);
	
	public String recent(NoteVO vo);

}
