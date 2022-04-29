package com.talk.post.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.talk.post.domain.PostVO;
import com.talk.post.service.PostAtService;
import com.talk.post.service.PostLikeService;
import com.talk.post.service.PostService;
import com.talk.post.service.PostTagService;
import com.talk.post.service.TagService;

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
	
	@DeleteMapping("delete/{post_num}")
	public String delete(@PathVariable long post_num) {
		service.delete(post_num);
		return ""; // 나중에 마이룸으로 리다이렉트 예정
	}
	
	@PostMapping("updateForm/{post_num}")
	public String updateForm(@PathVariable long post_num) {
		service.select(post_num);
		return "post/updateForm";
	}
	
	@PostMapping("update/{post_num}")
	public String update(@PathVariable long post_num, PostVO vo) {
		service.update(vo);
		return "post/detail";
	}
			
			
			
			
	
}



























