package com.talk.user.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.talk.user.domain.AuthVO;
import com.talk.user.domain.BanVO;
import com.talk.user.domain.FollowVO;
import com.talk.user.domain.MemberVO;
import com.talk.user.domain.NoteVO;
import com.talk.user.domain.SecurityUser;
import com.talk.user.domain.UserVO;
import com.talk.user.mapper.AuthMapper;
import com.talk.user.mapper.NoteMapper;
import com.talk.user.service.AuthService;
import com.talk.user.service.BanService;
import com.talk.user.service.BanServiceImpl;
import com.talk.user.service.FollowService;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.talk.naver.NaverLoginBO;
import com.talk.post.domain.Criteria;
import com.talk.post.domain.PostVO;
import com.talk.post.service.TagService;
import com.talk.reply.domain.ReplyVO;
import com.talk.user.service.FollowServiceImpl;
import com.talk.user.service.NoteService;
import com.talk.user.service.UserService;
import com.talk.user.service.UserServiceImpl;
import com.talk.naver.NaverLoginBO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private BanService banService;
	
	@Autowired
	private FollowService followService;
	
	@Autowired
	private AuthService authService;

	@Autowired
	private NaverLoginBO naverLoginBO;
	//user단
	
	//쪽지
	@Autowired
	private NoteMapper noteMapper;
	
	@Autowired
	private NoteService noteService;
	
	@GetMapping(value={ "/", ""})
	public String userHome() {
		return "user/userHome";
	}

	@GetMapping(value={ "/userInfo/{uid}", "/userInfo"})
	public String userInfo(@PathVariable (value = "uid", required = false) String uid , 
			Model model) {

		if(uid == null ) {
			return "redirect:/user/getAllUsers";
		}

		UserVO user_info = userService.selectById(uid);
		model.addAttribute("userInfo",user_info);
			

		return "user/userInfo";
	}
	
	@GetMapping("/room/{user_id}")
    public String room(@PathVariable String user_id, Model model) {
        UserVO user = userService.selectById(user_id);
        model.addAttribute("user", user);
        return "user/room";
    }
	
	@GetMapping(value="/getAllUsers")
	public String getAllUsers( Model model) {
		List<UserVO> user_info_list = userService.selectAll();
		model.addAttribute("userInfoList",user_info_list);
		model.addAttribute("ban_service",banService);
		model.addAttribute("follow_service",followService);
		
		return "user/getAllUsers";
	}

	@GetMapping(value="/follow")
	public void follow() {
	}

	@GetMapping(value="/freind")
	public void freind() {
	}

	@GetMapping(value="/favorite")
	public void favorite() {
	}
	
	@GetMapping(value="/followed/{user_id}", produces= {
//			MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<FollowVO>> followed(@PathVariable String user_id){
	
	ResponseEntity<List<FollowVO>> entity= null;
	
	try {
		entity = new ResponseEntity<>(followService.selectIdsByFollowed(user_id), HttpStatus.OK);
	}catch(Exception e) {
		e.printStackTrace();
		entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}
		return entity;
	}
	
	
	@GetMapping(value="/update")
	public String update(String uid,
			Model model) {
		
		System.out.println("uid : " + uid);
		
		UserVO user = userService.selectById(uid);
		
		model.addAttribute("userInfo",user);

		return "/user/updateForm";
	}
	
	@GetMapping(value="/updateUser")
	public String updateUser(
				UserVO vo, 
				Model model)
			throws DataIntegrityViolationException
	{
		
		try {
			userService.update(vo);
			return "redirect:/user/";
    	} catch(DataIntegrityViolationException e) {
    		System.out.println("DuplicateKeyException");
    	} catch(Exception e) {
    		System.out.println("Another Exception : " + e); 
    	}
		
		return "redirect:/user/";
	}
	
	@GetMapping(value="/delete")
	public String delete() {
		return "/user/deleteForm";
	}
	
	@PostMapping(value="/delete")
	public String deleteUser(
			String uid, String upw,
			HttpSession session) {
		
		UserVO userInfo = userService.loginCheck(uid, upw); 
		// 이 값이 null이면 아이디나 비밀번호가 맞지 않다는 것이므로 회원탈퇴 처리하지 않음
		
		if(userInfo != null) {//구분해서 처리 예정

			authService.deleteAll(uid);
			userService.delete(uid);

			System.out.println("delete 성공");
			session.invalidate();
			return "redirect:/user/";
		}
		else {//실패시 실패했다는 메시지를 띄우도록
			System.out.println("delete 실패");
			return "redirect:/user/";
		}
		
	}
	
	@GetMapping(value="/insert")
	public String insert() {
		return "/user/insertForm";
	}
	
	@PostMapping(value="/insert")
	public String insertUser(UserVO vo,String[] roles) throws DataIntegrityViolationException{

		System.out.println("user_id : " + vo.getUser_id()); 
		System.out.println("user_name : " + vo.getUser_name());

		List<AuthVO> authList = new ArrayList<AuthVO>();
		for(String role : roles) {
			AuthVO auth = new AuthVO();
			auth.setUser_id(vo.getUser_id());
			auth.setAuthority(role);
			authList.add(auth);
			
			System.out.println("authList = " + auth.toString());
		}
		
		UserVO uavo = vo;
		uavo.setAvos(authList);
		
		try {
			userService.insert(uavo);
			
			return "redirect:/user/userInfo/" + vo.getUser_id();
    	} catch(DataIntegrityViolationException e) {
    		System.out.println("DuplicateKeyException");
    	} catch(Exception e) {
    		System.out.println("Another Exception : " + e); 
    	}

		return "redirect:/user/";
		

	}

	@GetMapping(value="/login")
	public void login(String error, String logout, Model model) {
		System.out.println("error 여부 : " + error);
		System.out.println("logout 여부 : " + logout);
		
		if(error != null) {
			model.addAttribute("error", "로그인 관련 에러입니다. 계정확인을 다시 해 주세요.");
		}
		if(logout != null) {
			model.addAttribute("logout", "로그아웃 했습니다.");
		}	
	}

	@PostMapping(value="/login")
	public void loginUser(String uid, String upw, HttpServletRequest request) {
		System.out.println("login post ");
		System.out.println("uid : " + uid);
		System.out.println("upw : " + upw);
			

		UserVO userInfo = userService.loginCheck(uid, upw);
		

		if(userInfo != null) {//구분해서 처리 예정
			System.out.println("로그인 성공");
			
			return ;
		}

		System.out.println("로그인 실패");
		return;
	}
	
	@GetMapping(value="/logout")
	public String logoutGet() {

		return "user/logoutForm";
	}
	
	@PostMapping(value="/logout")
	public String logoutPost(HttpSession session) {

		System.out.println("컨트롤러 로그아웃");
		session.invalidate(); 

		return "redirect:/user";
	}

	
	//팔로우, 밴 단


	// count follower
	@GetMapping(value="/countFollower/{user_id}",produces= {MediaType.APPLICATION_XML_VALUE,
													MediaType.APPLICATION_JSON_UTF8_VALUE})
	
	public ResponseEntity<Integer> countFollower(@PathVariable("user_id")String user_id){
		
		ResponseEntity<Integer> entity= null;
		
		try {
			entity = new ResponseEntity<>(followService.countFollower(user_id),HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		System.out.println("countFollower : "+ entity);
		return entity;
	}

	// select follower
	@GetMapping(value="/getFollowerList/{user_id}",produces= {MediaType.APPLICATION_XML_VALUE,
													MediaType.APPLICATION_JSON_UTF8_VALUE})
	
	public ResponseEntity<List<FollowVO>> getFollower(@PathVariable("user_id")String user_id){
		
		ResponseEntity<List<FollowVO>> entity= null;
		
		try {
			entity = new ResponseEntity<>(followService.selectIdsByFollower(user_id),HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		System.out.println("getFollower : "+ entity);
		return entity;
	}

	// count followed
	@GetMapping(value="/countFollowed/{user_id}",produces= {MediaType.APPLICATION_XML_VALUE,
													MediaType.APPLICATION_JSON_UTF8_VALUE})
	
	public ResponseEntity<Integer>countFollowed(@PathVariable("user_id")String user_id){
		
		ResponseEntity<Integer> entity= null;
		
		try {
			entity = new ResponseEntity<>(followService.countFollowed(user_id),HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		System.out.println("countFollowed : "+ entity);
		return entity;
	}



	// select followed
	@GetMapping(value="/getFollowedList/{user_id}",produces= {MediaType.APPLICATION_XML_VALUE,
													MediaType.APPLICATION_JSON_UTF8_VALUE})
	
	public ResponseEntity<List<FollowVO>> getFollowed(@PathVariable("user_id")String user_id){
		
		ResponseEntity<List<FollowVO>> entity= null;
		
		try {
			entity = new ResponseEntity<>(followService.selectIdsByFollowed(user_id),HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		System.out.println("getFollowed : "+ entity);
		return entity;
	}

	// select followed
	@GetMapping(value="/getFreindList/{user_id}",produces= {MediaType.APPLICATION_XML_VALUE,
													MediaType.APPLICATION_JSON_UTF8_VALUE})
	
	public ResponseEntity<List<UserVO>> getFriendList(@PathVariable("user_id")String user_id){
		
		ResponseEntity<List<UserVO>> entity= null;
		
		try {
			entity = new ResponseEntity<>(followService.getFriendList(user_id),HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		System.out.println("getFriendList : "+ entity);
		return entity;
	}
	
	// select followed
	@GetMapping(value="/getFavoriteList/{user_id}",produces= {MediaType.APPLICATION_XML_VALUE,
													MediaType.APPLICATION_JSON_UTF8_VALUE})
	
	public ResponseEntity<List<UserVO>> getFavoriteList(@PathVariable("user_id")String user_id){
		
		ResponseEntity<List<UserVO>> entity= null;
		
		try {
			entity = new ResponseEntity<>(followService.getFavoriteList(user_id),HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		System.out.println("getFriendList : "+ entity);
		return entity;
	}
	

	//  update favorite
	@PostMapping(value="/checkFavorite",produces= {MediaType.APPLICATION_XML_VALUE,
													MediaType.APPLICATION_JSON_UTF8_VALUE})
	
	public ResponseEntity<String> checkFavorite(@RequestBody FollowVO vo){
		
		ResponseEntity<String> entity= null;
			System.out.println("checkFavorite : "+vo.toString());
				try {
					followService.update(vo);
					entity = new ResponseEntity<>("checkFavorite favorite Success",HttpStatus.OK);
				}catch(DataIntegrityViolationException e) {
					e.printStackTrace();
					System.out.println("error : "+e);
					entity = new ResponseEntity<>("checkFavorite favorite Failed",HttpStatus.BAD_REQUEST);
				}
		System.out.println("banedList : "+ entity);
		return entity;
	}
	
	
	//  select ban
	@GetMapping(value="/getBan/{user_id}",produces= {MediaType.APPLICATION_XML_VALUE,
													MediaType.APPLICATION_JSON_UTF8_VALUE})
	
	public ResponseEntity<Integer> countBan(@PathVariable("user_id")String user_id){
		
		ResponseEntity<Integer> entity= null;
		
		try {
			entity = new ResponseEntity<>(banService.ban(user_id),HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		System.out.println("banList : "+ entity);
		return entity;
	}
	
	//  select ban
	@GetMapping(value="/getBaned/{user_id}",produces= {MediaType.APPLICATION_XML_VALUE,
													MediaType.APPLICATION_JSON_UTF8_VALUE})
	
	public ResponseEntity<Integer> countBaned(@PathVariable("user_id")String user_id){
		
		ResponseEntity<Integer> entity= null;
		
		try {
			entity = new ResponseEntity<>(banService.baned(user_id),HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		System.out.println("banedList : "+ entity);
		return entity;
	}
	
	// insert & delete follow
	@PostMapping(value="/follow", consumes="application/json", produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity <String> insertFollow(@RequestBody FollowVO vo){
		ResponseEntity<String> entity= null;
		System.out.println("insertFollow : " + vo.getFollower());
		System.out.println(vo.toString());
		try {
			followService.insert(vo);
			entity = new ResponseEntity<String>("FOLLOW SUCCESS", HttpStatus.OK);
		} catch(DataIntegrityViolationException e) {
			try {
				followService.delete(vo);
				entity = new ResponseEntity<String>("UNFOLLOW SUCCESS", HttpStatus.OK);
			} catch(DataIntegrityViolationException DVE) {
				System.out.println("DataIntegrityViolationException : " + DVE);
				entity = new ResponseEntity<String>(DVE.getMessage(), HttpStatus.BAD_REQUEST);
			}
    	}catch(Exception e) {
			System.out.println("FOLLOW Exception : " + e);
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		System.out.println(entity);
		return entity;
	}
	
	// insert & delete ban
	@PostMapping(value="/ban", consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity <String> insertBan(@RequestBody BanVO vo){
		ResponseEntity<String> entity= null;
		System.out.println("insertBan : " + vo.getUser_id());
		System.out.println(vo.toString());
		try {
			banService.insert(vo);
			entity = new ResponseEntity<String>("BAN SUCCESS", HttpStatus.OK);
		} catch(DataIntegrityViolationException e) {
			try {
				banService.delete(vo);
				entity = new ResponseEntity<String>("UNBAN SUCCESS", HttpStatus.OK);
			} catch(DataIntegrityViolationException DVE) {
				System.out.println("DataIntegrityViolationException : " + DVE);
				entity = new ResponseEntity<String>(DVE.getMessage(), HttpStatus.BAD_REQUEST);
			}
    	}catch(Exception e) {
			System.out.println("BAN Exception : " + e);
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		System.out.println(entity);
		return entity;
	}
	

	// 소셜 로그인
	@RequestMapping(value="/naverLogin", method = RequestMethod.GET)
	public String login(HttpSession session) {
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		session.setAttribute("url", naverAuthUrl);
		return "secu/customLogin";
	}
	
	

	// 네이버 로그인 결과를 DB에 적재하고 권한을 발급하는 메서드
	@RequestMapping (value="/naver/login", method = {RequestMethod.GET, RequestMethod.POST})
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException{
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		
		// 1. 로그인 사용자 정보 읽어오기
		String apiResult = naverLoginBO.getUserProfile(oauthToken);
		
		// 2. String형식인 apiResult를 json형태로 전환
		JSONParser parser = new JSONParser();
		Object obj=null;
		try {
			obj = parser.parse(apiResult);
		} catch (org.json.simple.parser.ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(obj == null) {
			return "redirect:/user/naverLogin";
		}
		
		JSONObject jsonObj = (JSONObject) obj;
		
		// 3. 데이터 파싱
		// TOP레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject) jsonObj.get("reponse");
		System.out.println("파싱해온 API :" + response_obj);
		
		// response의 nickname값 파싱
		String id = (String) response_obj.get("id");
		String email = (String) response_obj.get("email");
		String userName = (String) response_obj.get("nickname");
		
		UserVO user = new UserVO();
		List<AuthVO> authList = new ArrayList<AuthVO>();
		AuthVO auth = new AuthVO();
		UUID uuid = UUID.randomUUID();
		auth.setUser_id("NAVER_" + id);
		auth.setAuthority("ROLE_MEMBER");
		authList.add(auth);
		
		user.setUser_id("NAVER_" + id);
		user.setAvos(authList);
		user.setUser_pw(uuid.toString());
		user.setUser_name(userName);
		System.out.println("insert하기 전 마지막 체크 : " + user);
		
		// DB에 해당 유저가 없을 경우 join으로
		if(userService.selectById(id)==null){
			userService.insert(user);
		}		
		SecurityUser securityUser = new SecurityUser(user);
		
		// 시큐리티 권한 직접 세팅
		Authentication authentication = new UsernamePasswordAuthenticationToken(securityUser, null,securityUser.getAuthorities());
		SecurityContextHolder.getContext().setAuthentication(authentication);
		
		return "redirect:/user/getAllUsers";
		
	}
	
	
	
	
	/////////////// 쪽지
	// 쪽리 리스트
	@GetMapping(value="/noteList")
	public String noteList(Model model) {
		noteMapper.getList();
		List<NoteVO> noteList = noteService.getList();
		model.addAttribute("noteList",noteList);
		return "user/noteList";
		
	}
	
	// 쪽지 상세페이지
	@GetMapping(value="noteDetail/{note_num}")
	public String noteDetail(@PathVariable long note_num, Model model) {
		NoteVO note = noteService.select(note_num);
		model.addAttribute("note", note);
		model.addAttribute("note_num", note_num);
		return "user/noteDetail";
	}
	
	// 쪽지 작성
	@GetMapping(value="/noteInsert")
	public String noteInsertForm() {
		return "user/noteForm";
	}
	@PostMapping(value="/noteInsert")
	public String noteInsert(NoteVO note) {
		log.warn(note);
		System.out.println(note);
		noteService.insert(note);
		return "redirect:/user/noteList";
	}
	
	// 쪽지 삭제
	@PostMapping(value="/noteDelete")
	public String noteDelete(long note_num) {
		noteService.delete(note_num);
		return "redirect:/user/noteList";
	}
}
