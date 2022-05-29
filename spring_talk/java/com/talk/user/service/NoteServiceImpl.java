package com.talk.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.talk.user.domain.NoteCriteria;
import com.talk.user.domain.NoteVO;
import com.talk.user.mapper.NoteMapper;

@Service
public class NoteServiceImpl implements NoteService{
	
	@Autowired
	private NoteMapper noteMapper;
	
	
	@Override
	public List<NoteVO> getList(NoteCriteria cri) {
		return noteMapper.getList(cri);
	}

	@Override
	public NoteVO select(NoteVO vo) {
		return noteMapper.select(vo);
	}

	@Override
	public void insert(NoteVO vo) {
		noteMapper.insert(vo);
		
	}

	@Override
	public void delete(long note_num) {
		noteMapper.delete(note_num);
		
	}

	

}
