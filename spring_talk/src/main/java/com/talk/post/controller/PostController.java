package com.talk.post.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.talk.post.domain.Criteria;
import com.talk.post.domain.PostLikeVO;
import com.talk.post.domain.PostVO;
import com.talk.post.service.PostAtService;
import com.talk.post.service.PostLikeService;
import com.talk.post.service.PostService;
import com.talk.post.service.PostTagService;
import com.talk.post.service.TagService;
import com.talk.reply.domain.ReplyVO;
import com.talk.reply.service.ReplyService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/post")
public class PostController {
	
	@Autowired
	private PostService service;
	@Autowired
	private PostAtService atService;
	@Autowired
	private PostLikeService likeService;
	@Autowired
	private PostTagService postTag;
	@Autowired
	private TagService tag;	
	@Autowired
	private ReplyService replyService;
	
	@GetMapping("/insert")
	public String insert() {
		return "post/insertForm";
	}
	
	@PostMapping("/insert")
	public String insert(PostVO vo) {
		service.insert(vo);
		return "post/postDetail"; // 나중에 뉴스피드로 리다이렉트 예정
	}
	
	@GetMapping("/detail/{post_num}")
	public String detail(@PathVariable long post_num, Model model) {
		PostVO post = service.select(post_num);
		model.addAttribute("post", post);
		return "post/postDetail";
	}
	
	@GetMapping("/detail/test/{post_num}")
	public String detail2(@PathVariable long post_num, Model model) {
		PostVO post = service.select(post_num);
		model.addAttribute("post", post);
		return "post/replyTest";
	}
	
	@GetMapping("delete/{post_num}")
	public String delete(@PathVariable long post_num) {
		replyService.removeAllReply(post_num);
		service.delete(post_num);
		log.info(post_num + "번 게시글 삭제되었습니다.");
		return ""; // 나중에 마이룸으로 리다이렉트 예정
	}
	
	@GetMapping("updateForm/{post_num}")
	public String updateForm(@PathVariable long post_num, Model model) {
		PostVO post = service.select(post_num);
		model.addAttribute("post", post);
		return "post/updateForm";
	}
	
	@PostMapping("update")
	public String update(long post_num, PostVO vo) {
		service.update(vo);
		return "redirect:detail/" + post_num;
	}

	// 뉴스피드 기본주소
	@GetMapping(value="/newsfeed")
	public String postList(){
		return "post/newsfeed";
	}
	
	// 뉴스피드 비동기 로드
	@GetMapping(value="/newsfeed", produces= {
//			아래꺼 있으면 xml 형식으로 떠서 걍 지워버림
//			MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<PostVO>>list(Criteria cri){
	
	ResponseEntity<List<PostVO>> entity= null;
	
	try {
		entity = new ResponseEntity<>(service.getAllPost(cri),HttpStatus.OK);
	}catch(Exception e) {
		e.printStackTrace();
		entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}
		return entity;
	}
	
	
	// 특정 유저 게시글 뉴스피드 형식으로 불러오기 기본주소
	@GetMapping(value="/userfeed/{writer}")
	public String userPostList(@PathVariable("writer") String writer){
		return "post/userfeed";
	}
	
	// 비동기 유저 피드
	@GetMapping(value="/userfeed/{writer}", produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<PostVO>>list(@PathVariable("writer")String writer, @Param("page_num") Criteria cri){
	
	ResponseEntity<List<PostVO>> entity= null;
	
	try {
		System.out.println("도전");
		entity = new ResponseEntity<>(service.getUserPost(writer, cri),HttpStatus.OK);
		System.out.println("성공");
	} catch(Exception e) {
		e.printStackTrace();
		entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}
		return entity;
	}

	
	
	// LikeService 비동기
	
	// 좋아요
	@PostMapping(value="/like", consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity <String> like(@RequestBody PostLikeVO vo){
		ResponseEntity<String> entity= null;
		try {
			likeService.like(vo);
			entity = new ResponseEntity<String>("OK", HttpStatus.OK);
		}catch(Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 좋아요 취소
	@PostMapping(value="/unlike", consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity <String> unlike(@RequestBody PostLikeVO vo){
		ResponseEntity<String> entity= null;
		try {
			likeService.unlike(vo);
			entity = new ResponseEntity<String>("OK", HttpStatus.OK);
		}catch(Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
}

