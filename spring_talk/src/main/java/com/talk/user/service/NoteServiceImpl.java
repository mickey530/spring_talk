package com.talk.user.service;

import java.util.ArrayList;
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

	@Override
	public List<String> noteUserList(String login_id) {
		ArrayList<String> userList = new ArrayList<>();
		ArrayList<String> list = new ArrayList<>();
		list.addAll(noteMapper.left(login_id));
		list.addAll(noteMapper.right(login_id));
		
		for(String item : list){
            if(!userList.contains(item))
                userList.add(item);
        }
		return userList;
	}
	
	@Override
	public String recent(NoteVO vo) {
		return noteMapper.recent(vo);
	}

}
