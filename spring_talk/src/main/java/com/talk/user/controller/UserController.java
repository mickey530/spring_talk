package com.talk.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.talk.user.domain.UserVO;
import com.talk.user.service.BanService;
import com.talk.user.service.BanServiceImpl;
import com.talk.user.service.FollowService;
import com.talk.user.service.FollowServiceImpl;
import com.talk.user.service.UserService;
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
	
	@GetMapping(value="/userInfo")
	public String userInfo(Model model) {
		long uno =1; 
		try {
			UserVO user_info = userService.select(uno);
			String user_id = user_info.getUser_id();
			model.addAttribute("userInfo",user_info);
			model.addAttribute("baned",banService.baned(user_id));
			model.addAttribute("follower",followService.countFollower(user_id));
			model.addAttribute("followed",followService.countFollowed(user_id));
		}catch (Exception e) {
			// TODO: handle exception
		}
		return "user/userInfo";
	}

	
	@GetMapping(value="/getAllUsers")
	public String getAllUsers(Model model) {
		List<UserVO> user_info_list = userService.selectAll();
		model.addAttribute("userInfo",user_info_list);
		return "user/getAllUsers";
	}

	
}
