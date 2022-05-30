package com.talk.gall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.talk.gall.domain.SearchCriteria;
import com.talk.gall.domain.GallDogLikeVO;
import com.talk.gall.domain.GallDogVO;
import com.talk.gall.domain.GallListVO;
import com.talk.gall.domain.PageMaker;
import com.talk.gall.service.GallDogLikeService;
import com.talk.gall.service.GallDogReplyService;
import com.talk.gall.service.GallDogService;
import com.talk.gall.service.GallListService;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/gall")
public class GallDogController {
	
	@Autowired
	GallDogService service;
	
	@Autowired
	GallDogReplyService replyservice;
	
	@Autowired
	GallDogLikeService doglikeservice;
	
	@Autowired
	GallListService listservice;
	
	
	// 갤러리 구분해놓은 목록
	@GetMapping("gallList")
	public String gallList(String gall_name, Model model) {
		List<GallListVO> gall = listservice.list(gall_name);
		log.info(gall);
		model.addAttribute("gall",gall);
		return "gall/gallList";
	}
	
	// 게시글 작성 http://localhost:8181/gall/insert/gall_dog
	@GetMapping("/insert/{gall_name}" )
	public String insert(@PathVariable("gall_name") String gall_name, Model model) {
		return "gall/insertForm";
	}
	@PostMapping("/insert/{gall_name}")
	public String insert(@PathVariable("gall_name") String gall_name, GallDogVO vo) {
		service.insert(vo);
		return "redirect:/gall/list/"+ gall_name;
	}
	
	
	
	// 게시글 목록 http://localhost:8181/gall/list/gall_dog
	@GetMapping("/list/{gall_name}")
	public String dogList(@PathVariable("gall_name") String gall_name, GallListVO gall, SearchCriteria cri, Model model) {
		List<GallDogVO> dogList = service.allList(gall_name);
		model.addAttribute("dogList", dogList);

		model.addAttribute("gall", gall);
		
		/*
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		int countPage = service.countPageNum(cri);
		pageMaker.setTotalBoard(countPage);
		model.addAttribute("pageMaker", pageMaker);
		*/
		return "gall/dogList";
	}


	// 게시글 상세 http://localhost:8181/gall/detail/gall_dog
	@GetMapping("/detail/{gall_name}/{board_num}")
	public String detail(@PathVariable("gall_name") String gall_name,
							@PathVariable("board_num") Long board_num, Model model, GallDogVO vo) {
		GallDogVO dog = service.select(vo);
		service.upHit(vo);
		model.addAttribute("dog", dog);
		model.addAttribute("gall_name", gall_name);
		return "gall/dogDetail";
	}

	
	// 게시글 삭제
	@PostMapping("delete/{gall_name}/{board_num}")
	public String delete(@PathVariable long board_num, @PathVariable("gall_name") String gall_name, GallDogVO vo, Model model) {
		service.delete(vo);
		log.info(gall_name);
		return "redirect:/gall/list/" + gall_name;
	}
	
	
	
	// 게시글 수정
	@GetMapping("updateForm/{gall_name}/{board_num}")
	public String updateForm(@PathVariable("gall_name") String gall_name,
			@PathVariable("board_num") Long board_num, Model model, GallDogVO vo) {
			GallDogVO board = service.select(vo);
			model.addAttribute("board", board);
		return "gall/updateForm";
	}
	@PostMapping("update/{gall_name}/{board_num}")
	public String update(@PathVariable ("gall_name")String gall_name, long board_num, GallDogVO vo) {
		service.update(vo);
		return "redirect:/gall/detail/" +gall_name+"/"+ board_num;
	
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
		@PostMapping(value="/{gall_name}/like", consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
		public ResponseEntity <String> like(@PathVariable("gall_name")String gall_name, GallDogLikeVO vo){
			System.out.println("vo : "+vo.toString());
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
