package com.talk.gall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.talk.gall.domain.GallDogLikeVO;
import com.talk.gall.domain.GallDogVO;
import com.talk.gall.service.GallDogLikeService;
import com.talk.gall.service.GallDogReplyService;
import com.talk.gall.service.GallDogService;
import com.talk.post.domain.PostLikeVO;
import com.talk.post.domain.PostVO;
import com.talk.post.domain.UserCriteria;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/galldog")
public class GallDogController {
	
	@Autowired
	GallDogService service;
	
	@Autowired
	GallDogReplyService replyservice;
	
	@Autowired
	GallDogLikeService doglikeservice;
	
	
	// 갤러리 구분해놓은 목록
	@GetMapping("gallList")
	public String gallList() {
		return "gall/gallList";
	}
	
	
	
	// 게시글 작성
	@GetMapping("/insert")
	public String insert() {
		return "gall/insertForm";
	}
	@PostMapping("/insert")
	public String insert(GallDogVO vo) {
		service.insert(vo);
		return "gall/dogList";
	}
	
	
	
	// 게시글 목록
	@GetMapping("/dogList")
	public String dogList(Model model) {
		List<GallDogVO> dogList = service.allList(0);
		model.addAttribute("dogList", dogList);
		return "gall/dogList";
	}
	
	
	
	// 게시글 상세
	@GetMapping("/detail/{board_num}")
	public String detail(@PathVariable long board_num, Model model) {
		GallDogVO dog = service.select(board_num);
		model.addAttribute("dog", dog);
		return "gall/dogDetail";
	}

	
	
	// 게시글 삭제
	@GetMapping("delete/{board_num}")
	public String delete(@PathVariable long board_num) {
		service.delete(board_num);
		replyservice.delete(board_num);
		return "gall/dogList";
	}
	
	
	
	// 게시글 수정
	@GetMapping("updateForm/{board_num}")
	public String updateForm(@PathVariable long board_num, Model model) {
		GallDogVO dog = service.select(board_num);
		model.addAttribute("dog", dog);
		return "gall/updateForm";
	}
	@PostMapping("update")
	public String update(long board_num, GallDogVO vo) {
		service.update(vo);
		return "redirect:gall/detail/" + board_num;
	
	}	
	
	// 좋아요 확인
		@ResponseBody
		@PostMapping(value="/islike", consumes="application/json", produces= {
				MediaType.APPLICATION_XML_VALUE,
				MediaType.APPLICATION_JSON_UTF8_VALUE})
		public ResponseEntity<String> islike(@RequestBody GallDogLikeVO vo){
			ResponseEntity<String> entity= null;
			try {
				entity = new ResponseEntity<>(doglikeservice.islike(vo), HttpStatus.OK);
			}catch(Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
		
		// 좋아요 개수
		@GetMapping(value="/likeCount/{board_num}",produces= {MediaType.APPLICATION_XML_VALUE,
				MediaType.APPLICATION_JSON_UTF8_VALUE})

		public ResponseEntity<Long> likeCount(@PathVariable("board_num")long board_num){
		
		ResponseEntity<Long> entity= null;
		
		try {
		entity = new ResponseEntity<>(doglikeservice.likeCount(board_num), HttpStatus.OK);
		}catch(Exception e) {
		e.printStackTrace();
		entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
		}	
		
		
		// 좋아요
		@PostMapping(value="/like", consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
		public ResponseEntity <String> like(@RequestBody GallDogLikeVO vo){
			ResponseEntity<String> entity= null;
			try {
				doglikeservice.like(vo);
				entity = new ResponseEntity<String>("OK", HttpStatus.OK);
			}catch(Exception e) {
				entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
}
