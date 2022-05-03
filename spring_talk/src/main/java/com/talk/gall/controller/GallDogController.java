package com.talk.gall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import com.talk.gall.domain.GallDogVO;
import com.talk.gall.service.GallDogService;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/galldog")
public class GallDogController {
	
	@Autowired
	GallDogService service;
	

	@GetMapping("/insert")
	public String insert() {
		return "galldog/insertForm";
	}
	
	@PostMapping("/insert")
	public String insert(GallDogVO vo) {
		service.insert(vo);
		return "galldog/postDetail"; // 나중에 뉴스피드로 리다이렉트 예정
	}
	
	@GetMapping("/detail/{board_num}")
	public String detail(@PathVariable long board_num, Model model) {
		GallDogVO gall = service.select(board_num);
		model.addAttribute("gall", gall);
		return "gall/gallDetail";
	}
	
	@GetMapping("delete/{board_num}")
	public String delete(@PathVariable long board_num) {
		service.delete(board_num);
		log.info(board_num + "번 게시글 삭제되었습니다.");
		return "gall/delete";
	}
	
	@GetMapping("updateForm/{board_num}")
	public String updateForm(@PathVariable long board_num, Model model) {
		GallDogVO gall = service.select(board_num);
		model.addAttribute("gall", gall);
		return "gall/updateForm";
	}
	
	@PostMapping("update")
	public String update(long board_num, GallDogVO vo) {
		service.update(vo);
		return "redirect:detail/" + board_num;
		
		
	// 	PostController 참고하여 기재
	}
	
}
