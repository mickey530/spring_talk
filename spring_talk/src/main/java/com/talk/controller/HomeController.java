package com.talk.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.UUID;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.talk.user.domain.AuthVO;
import com.talk.user.domain.SecurityUser;
import com.talk.user.domain.UserVO;
import com.talk.user.service.UserService;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.talk.file.domain.ImageFileVO;
import com.talk.file.domain.ThumbnailVO;
import com.talk.naver.NaverLoginBO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log4j
public class HomeController {
	
//	@Autowired
//	private PayService service;
	
	@Autowired
	UserService userService;
	
	@Autowired
	NaverLoginBO naverLoginBO;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	@GetMapping("pay")
	public void pay( ) {
		
	}
	
	//업로드 테스트 시작 단
	
	@GetMapping("uploadTest")
	public String uploadTest( ) {
		return "uploadTest";
	}
	
	//업로드 테스트 끝 단
//		@ResponseBody
//		@PostMapping(value="/order", consumes="application/json",
//										produces= {MediaType.TEXT_PLAIN_VALUE})
//		public ResponseEntity<String>orderInsert(@RequestBody PayVO vo){
//			log.info("VO검증" + vo);
//			service.insertPay(vo);
//			return new ResponseEntity<String>("success", HttpStatus.OK);
//		}
		
		// 네이버 로그인 결과를 DB에 적재하고 권한을 발급하는 메서드
		@RequestMapping (value="/naver/login", method = {RequestMethod.GET, RequestMethod.POST})
		public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException{
			OAuth2AccessToken oauthToken;
			System.out.println("callback 확인용");

			oauthToken = naverLoginBO.getAccessToken(session, code, state);
			
			// 1. 로그인 사용자 정보 읽어오기
			String apiResult = naverLoginBO.getUserProfile(oauthToken);
			
			System.out.println("apiResult : " + apiResult);
			
			// 2. String형식인 apiResult를 json형태로 전환
			JSONParser parser = new JSONParser();
			Object obj=null;
			try {
				obj = parser.parse(apiResult);
				System.out.println("obj : " + obj);
			} catch (org.json.simple.parser.ParseException e) {
				// TODO Auto-generated catch block
				System.out.println("ParseException : " + e);
				e.printStackTrace();
			} catch(Exception e) {
				System.out.println("Exception : " + e);
			}
			
			if(obj == null) {
				System.out.println("4-1");
				return "redirect:/user";
			}
			System.out.println("4-2");

			
			JSONObject jsonObj = (JSONObject) obj;

			System.out.println("obj : " + obj);
			
			// 3. 데이터 파싱
			// TOP레벨 단계 _response 파싱
			JSONObject response_obj = (JSONObject) jsonObj.get("response");

			System.out.println("파싱해온 API :" + response_obj);
			
			// response의 nickname값 파싱
			String id = "NAVER_" + response_obj.get("id");
			System.out.println("id : " + id);
			String email = (String) response_obj.get("email");
			System.out.println("email : " + email);
			String userName = (String) response_obj.get("nickname");
			System.out.println("nickname : " + userName);
			
			UserVO user = new UserVO();
			List<AuthVO> authList = new ArrayList<AuthVO>();
			AuthVO auth = new AuthVO();
			UUID uuid = UUID.randomUUID();
			auth.setUser_id(id);
			auth.setAuthority("ROLE_MEMBER");
			authList.add(auth);
			
			user.setUser_id(id);
			user.setAvos(authList);
			user.setUser_pw(uuid.toString());
			user.setUser_name(userName);
			System.out.println("insert하기 전 마지막 체크 : " + user);
			UserVO usr = userService.selectById(id);
			System.out.println("insert하기 전 마지막 체크 유저 존재? : " + usr);
			// DB에 해당 유저가 없을 경우 join으로
			if(usr==null){
				userService.insert(user);
			}else {
				System.out.println("유저 존재?");
			}
			SecurityUser securityUser = new SecurityUser(user);
			
			// 시큐리티 권한 직접 세팅
			Authentication authentication = new UsernamePasswordAuthenticationToken(securityUser, null,securityUser.getAuthorities());
			SecurityContextHolder.getContext().setAuthentication(authentication);

			return "redirect:/user/getAllUsers";
		}
}