package com.talk.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.talk.user.domain.NoteVO;
import com.talk.user.mapper.NoteMapper;

@Service
public class NoteServiceImpl implements NoteService{
	
	@Autowired
	private NoteMapper noteMapper;
	
	
	@Override
	public List<NoteVO> getList(NoteVO vo) {
		return noteMapper.getList(vo);
	}

	@Override
	public NoteVO select(long note_num) {
		return noteMapper.select(note_num);
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
