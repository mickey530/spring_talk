package com.talk.user.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.talk.user.domain.UserVO;
import com.talk.user.service.BanServiceImpl;
import com.talk.post.service.TagService;
import com.talk.user.service.FollowServiceImpl;
import com.talk.user.service.UserServiceImpl;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserServiceImpl userService;
	
	@Autowired
	private BanServiceImpl banService;
	
	@Autowired
	private FollowServiceImpl followService;
	
	@GetMapping(value={ "/", ""})
	public String userHome(Model model,
			HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		System.out.println("session user_id : " + session.getAttribute("user_id"));
		System.out.println("session user_name : " + session.getAttribute("user_name"));

		model.addAttribute("user_id",session.getAttribute("user_id"));
		model.addAttribute("user_name",session.getAttribute("user_name"));
		return "user/userHome";
	}

	
	@GetMapping(value={ "/userInfo/{uid}", "/userInfo"})
	public String userInfo(@PathVariable (value = "uid", required = false) String uid , Model model) {

		if(uid == null ) {
			return "redirect:/user/getAllUsers";
		}

		UserVO user_info = userService.selectById(uid);
		String user_id = user_info.getUser_id();
		model.addAttribute("userInfo",user_info);
		model.addAttribute("baned",banService.baned(user_id));
		model.addAttribute("follower",followService.countFollower(user_id));
		model.addAttribute("followed",followService.countFollowed(user_id));
			

		return "user/userInfo";
	}
	
	@GetMapping(value="/getAllUsers")
	public String getAllUsers( Model model) {
		List<UserVO> user_info_list = userService.selectAll();
		model.addAttribute("userInfoList",user_info_list);
		model.addAttribute("ban_service",banService);
		model.addAttribute("follow_service",followService);
		
		return "user/getAllUsers";
	}
	
	
	@GetMapping(value="/update")
	public String update(Model model,
			HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
		String uid = (String)session.getAttribute("user_id");
		
		System.out.println("session user_id : " + uid);
		
		UserVO user = userService.selectById(uid);
		
		System.out.println("selectById 통과 ");
		
		model.addAttribute("userInfo",user);

		System.out.println("addAttribute 통과 ");
		return "/user/updateForm";
	}
	
	
	@GetMapping(value="/updateUser")
	public String updateUser(UserVO vo, Model model,
			HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		session.setAttribute("user_name", vo.getUser_name()); 
		
		userService.update(vo);
		return "redirect:/user/";
	}
	
	@GetMapping(value="/delete")
	public String delete() {
		return "/user/deleteForm";
	}
	
	@GetMapping(value="/deleteUser")
	public String deleteUser(
			String uid, String upw,
			HttpSession session, HttpServletRequest request, HttpServletResponse response) {

		System.out.println("check value : ID = " + uid);
		System.out.println("check value : PW = " + upw);
		
		UserVO userInfo = userService.loginCheck(uid, upw); 
		// 이 값이 null이면 아이디나 비밀번호가 맞지 않다는 것이므로 회원탈퇴 처리하지 않음
		
		if(userInfo != null) {//구분해서 처리 예정

			long user_num = userInfo.getUser_num();
			
			userService.delete(user_num);
			
			session.invalidate();
			return "redirect:/user/";
		}
		else {//실패시 실패했다는 메시지를 띄우는 곳으로 이동
			return "redirect:/user/";
		}
		
	}
	
	@GetMapping(value="/insert")
	public String insert() {
		return "/user/insertForm";
	}
	
	@GetMapping(value="/insertUser")
	public String insertUser(UserVO vo,
			HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
		userService.insert(vo);
		//같은 값을 넣으려하면 오류 발생
		//수정 필요함

		session.setAttribute("user_id", vo.getUser_id()); 
		session.setAttribute("user_name", vo.getUser_name()); 
		

		return "redirect:/user/userInfo/"+vo.getUser_id();
	}

	
	@GetMapping(value="/loginForm")
	public String login() {
		return "/user/loginForm";
	}

	@GetMapping(value="/login")
	public String loginUser(
			String uid, String upw,
			Model model, 
			HttpSession session, HttpServletRequest request, HttpServletResponse response) {

		System.out.println("check value : ID = " + uid);
		System.out.println("check value : PW = " + upw);
		
		UserVO userInfo = userService.loginCheck(uid, upw);
		

		if(userInfo != null) {//구분해서 처리 예정
			session.setAttribute("user_id", userInfo.getUser_id()); 
			session.setAttribute("user_name", userInfo.getUser_name()); 
			
			return "redirect:/user/";
		}

		return "redirect:/user/";
	}
	
	@GetMapping(value="/logout")
	public String loout(
			HttpSession session, HttpServletRequest request, HttpServletResponse response) {


		session.invalidate(); 

		return "redirect:/user/";
	}
}