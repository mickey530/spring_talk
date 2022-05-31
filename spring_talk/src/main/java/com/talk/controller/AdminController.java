package com.talk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.ui.Model;

import com.talk.gall.domain.GallDogVO;
import com.talk.gall.domain.GallListVO;
import com.talk.gall.service.GallListService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class AdminController {

	@Autowired
	GallListService listservice;
	
	
	
	// gall 관리자 페이지
	@GetMapping("/admin")
	public String admin() {
		return "gall/gallAdmin";
	}
	// gallAdmin 폼에서 날라온 데이터
	@PostMapping("gallList")
	public String gallList(GallListVO vo, String gall_name, String table_name, Model model) {
		listservice.create(vo);
        listservice.createTbl(table_name);
        listservice.ReplyTbl(table_name);
		return "redirect:/gall/gallList";
	}

	
	
	// 테이블 삭제
	@PostMapping("delete/{table_name}")
	public String delete(@PathVariable("table_name")String table_name) {
		log.info(table_name);
		listservice.deleteTbl(table_name);
		return "redirect:/gall/gallList";
	}
	
}

