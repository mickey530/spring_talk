package com.talk.post.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.talk.file.domain.ImageFileDTO;
import com.talk.file.domain.ImageFileVO;
import com.talk.file.domain.ThumbnailVO;
import com.talk.file.service.FileService;
import com.talk.post.domain.AdVO;
import com.talk.post.domain.Criteria;
import com.talk.post.domain.FollowCriteria;
import com.talk.post.domain.PostDTO;
import com.talk.post.domain.PostLikeVO;
import com.talk.post.domain.PostVO;
import com.talk.post.domain.UserCriteria;
import com.talk.post.service.AdService;
import com.talk.post.service.PostAtService;
import com.talk.post.service.PostLikeService;
import com.talk.post.service.PostService;
import com.talk.post.service.PostTagService;
import com.talk.post.service.TagService;
import com.talk.reply.domain.ReplyVO;
import com.talk.reply.service.ReplyService;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

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
	@Autowired
	private FileService fileService;
	@Autowired
	private AdService adService;
	
//	public final String uploadFolder = "/Users/user/upload_data/temp/";
	public final String uploadFolder = "c:\\upload_data\\temp\\";
	
	@GetMapping("/insert")
	public String insert() {
		return "post/insertForm";
	}
	
	@PostMapping("/insert")
	public String insert(PostDTO vo) {
		System.out.println("pvo : " + vo.getPostVO().toString());
		if(vo.getIfVOs() == null) {
			System.out.println("ifVOs : null");
			service.insert(vo.getPostVO(),null);
		}else {
			System.out.println("ifVOs : " + vo.getIfVOs().size());
			service.insert(vo.getPostVO(),vo.getIfVOs());
		}
		return "post/newsfeed"; // 나중에 뉴스피드로 리다이렉트 예정
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
	
	@PostMapping("delete/{post_num}")
	public String delete(@PathVariable long post_num) {
		service.delete(post_num);
		log.info(post_num + "번 게시글 삭제되었습니다.");
		return "redirect:/post/newsfeed"; // 나중에 마이룸으로 리다이렉트 예정
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
	@ResponseBody
	@GetMapping(value="/newsfeed", produces= {
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
	
	
	// 유저피드 기본주소
	@GetMapping(value="/userfeed/{writer}")
	public String UserPostList(@PathVariable("writer")String writer){
		return "post/userfeed";
	}
	
	// 유저피드 비동기 로드
	@GetMapping(value="/userfeed/{writer}", produces= {
//			아래꺼 있으면 xml 형식으로 떠서 걍 지워버림
//			MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<PostVO>>list(@PathVariable("writer")String writer, UserCriteria cri){
	ResponseEntity<List<PostVO>> entity= null;
	
	try {
		entity = new ResponseEntity<>(service.getUserPost(cri),HttpStatus.OK);
	}catch(Exception e) {
		e.printStackTrace();
		entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}
		return entity;
	}
	
	// 팔로잉 피드 기본주소
	@GetMapping(value="/followfeed/{login_id}")
	public String followingPostList(@PathVariable("login_id")String login_id){
		return "post/followfeed";
	}
	
	// 팔로잉 피드 비동기 로드
	@GetMapping(value="/followfeed/{login_id}", produces= {
//			아래꺼 있으면 xml 형식으로 떠서 걍 지워버림
//			MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<PostVO>>followingPostList(@PathVariable("login_id")String login_id, FollowCriteria cri){
	ResponseEntity<List<PostVO>> entity= null;
	log.info("????" + login_id);
	
	try {
		entity = new ResponseEntity<>(service.getFollowingPost(cri),HttpStatus.OK);
		log.info("????" + service.getFollowingPost(cri));

	}catch(Exception e) {
		e.printStackTrace();
		entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}
		return entity;
	}
	
	
	// LikeService 비동기	
	
	// 좋아요 확인
	@ResponseBody
	@PostMapping(value="/islike", consumes="application/json", produces= {
			MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<String> islike(@RequestBody PostLikeVO vo){
		ResponseEntity<String> entity= null;
		try {
			entity = new ResponseEntity<>(likeService.islike(vo), HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	// 좋아요 개수
	@GetMapping(value="/likeCount/{post_num}",produces= {MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE})

	public ResponseEntity<Long> likeCount(@PathVariable("post_num")long post_num){
	
	ResponseEntity<Long> entity= null;
	
	try {
		entity = new ResponseEntity<>(likeService.likeCount(post_num),HttpStatus.OK);
	}catch(Exception e) {
		e.printStackTrace();
		entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}
	return entity;
	}	
	
	
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
	
	// 뉴스피드 광고
	@ResponseBody
	@GetMapping(value="/ad", produces= {
//			MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<AdVO> ad(int ad_num){
	
	ResponseEntity<AdVO> entity= null;
	
	try {
		entity = new ResponseEntity<>(adService.select(ad_num),HttpStatus.OK);
	}catch(Exception e) {
		e.printStackTrace();
		entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}
		return entity;
	}
	
	

	//업로드 테스트 시작 단
	@PostMapping(value="/uploadAjaxAction",
			produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
@ResponseBody
public ResponseEntity<List<ThumbnailVO>> uploadAjaxPost(MultipartFile[] uploadFile) {
	
	System.out.println("ajax post update!");

	List<ThumbnailVO> list = new ArrayList<>();
	
	String uploadFolderPath = getFolder();
	
	// 폴더 생성 로직
	File uploadPath = new File(uploadFolder, uploadFolderPath);
	System.out.println("upload path : " + uploadPath);
	
	if(uploadPath.exists() == false) {
		uploadPath.mkdirs();
	}
	
	for(MultipartFile multipartFile : uploadFile) {
		System.out.println("==============================");
		System.out.println("upload file name : " + multipartFile.getOriginalFilename());
		System.out.println("Upload file size : " + multipartFile.getSize());

		ImageFileVO imageVO = new ImageFileVO();
		ThumbnailVO attachVO = new ThumbnailVO();
		
		String uploadFileName = multipartFile.getOriginalFilename();
		
		uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
		System.out.println("last file name : " + uploadFileName);
		
		// uploadFileName에 의해 파일이름을 얻어왔으면 파일명을 attachDTO에 집어넣음
		attachVO.setFile_name(uploadFileName);
		
		// uuid 발급 부분
		UUID uuid = UUID.randomUUID();
		
		uploadFileName = uuid.toString() + "_" + uploadFileName;
		
		//File saveFile = new File(uploadFolder, uploadFileName);
		
		
		try {
			
			
			File saveFile = new File(uploadPath, uploadFileName);
			
			System.out.println("saveFile :" + saveFile );
			
			multipartFile.transferTo(saveFile);
			
			attachVO.setUuid(uuid.toString());
			attachVO.setUpload_path(uploadFolderPath);

			imageVO.setFile_name(uploadFolderPath);
			imageVO.setFile_type(checkFileType(uploadFileName));
			imageVO.setUpload_path(uploadFolderPath);
			imageVO.setUuid(uuid.toString());
			System.out.println("파일 형식 : " + checkFileType(uploadFileName)) ;
			boolean isImage = false;
			log.info("파일 경로 : " + uploadFolderPath);
			try {
				isImage = Files.probeContentType(saveFile.toPath()).startsWith("image");
			}
			catch(Exception e) {
				e.printStackTrace();
				continue;
			}
			
			// 이 아래부터 썸네일 생성로직
			if(isImage) {
				
				System.out.println(uploadFileName + " is Image");
				
				FileOutputStream thumbnail =
					new FileOutputStream(new File(uploadPath, "s_"+uploadFileName));
				
				Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 1000, 1000);
				thumbnail.close();
			}
			
			list.add(attachVO);
			
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}//endfor
	return new ResponseEntity<>(list, HttpStatus.OK);
}

	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type){
		log.info("deleteFile: " + fileName);
		log.info(type);
		
		File file = null;
		
		try {
			file = new File(uploadFolder + URLDecoder.decode(fileName, "UTF-8"));
			
			file.delete();
			
			String largeFileName = file.getAbsolutePath().replace("s_", "");
				
			log.info("largeFileName : " + largeFileName);
				
			file = new File(largeFileName);
				
			file.delete();
		} catch(UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
		
	}
	

	
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName){
		
		System.out.println("fileName : " + fileName);
		
		File file = new File(uploadFolder + fileName);
		
		System.out.println("file: " + file);
		
		
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch(IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	
	
	public String checkFileType(String file_name) {
		
		String fileType =  file_name.substring(file_name.indexOf(".")+1);
		if(fileType.equals("BMP") ||fileType.equals("TIFF") ||fileType.equals("JPEG") ||fileType.equals("JPG") || fileType.equals("PNG") 
				||fileType.equals("bmp") ||fileType.equals("tiff") ||fileType.equals("jpeg") ||fileType.equals("jpg") ||fileType.equals("png") )
		{
			fileType = "IMG";
		}
		return fileType;
	}
	

	
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
	
		return str.replace("-", File.separator);
	}

	@GetMapping(value="/getImages/{post_num}",  produces= {MediaType.APPLICATION_XML_VALUE,
												MediaType.APPLICATION_JSON_UTF8_VALUE})
	
	public ResponseEntity<List<ImageFileVO>>getImages(@PathVariable("post_num")Long post_num){
		ResponseEntity<List<ImageFileVO>> entity= null;
		try {
			entity = new ResponseEntity<>(fileService.select(post_num),HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			System.out.println("getImages error : " +e);
		}
			return entity;
	}

	//업로드 테스트 끝 단
		
}

