package com.talk.post.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;

import com.talk.file.domain.ImageFileVO;
import com.talk.file.service.FileService;
import com.talk.post.domain.Criteria;
import com.talk.post.domain.FollowCriteria;
import com.talk.post.domain.PostVO;
import com.talk.post.domain.UserCriteria;
import com.talk.post.mapper.PostLikeMapper;
import com.talk.post.mapper.PostMapper;
import com.talk.reply.mapper.ReplyMapper;
import com.talk.report.service.ReportPostService;

@Service
public class PostServiceImpl implements PostService{

	@Autowired
	private PostMapper postMapper;
	
	@Autowired
	private ReplyMapper replyMapper;
	
	@Autowired
	private PostLikeMapper postLikeMapper;
	
	@Autowired
	private FileService fileService;
	
	@Autowired
	private ReportPostService reportPostService;

	@Override
	public void insert(PostVO vo,@PathVariable (value = "ifVOs" , required = false) List<ImageFileVO> ifVOs) {
		postMapper.insert(vo);
		System.out.println("postNum = "+vo.getPost_num());;
		
		if(ifVOs != null && ifVOs.size() > 0) {
			ifVOs.forEach(imageFile -> {
				imageFile.setPost_num(vo.getPost_num());
			});
			fileService.insert(ifVOs);
		}
	}

	@Override
	public PostVO select(long post_num) {
		return postMapper.select(post_num);
	}

	@Transactional
	@Override
	public void delete(long post_num) {
		reportPostService.removeReport(post_num);
		postMapper.delete(post_num);
	}

	@Override
	public void update(PostVO vo) {
		postMapper.update(vo);
	}

	@Override
	public List<PostVO> getAllPost(Criteria cri) {
		return postMapper.getAllPost(cri);
	}

	@Override
	public List<PostVO> getUserPost(UserCriteria cri) {
		return postMapper.getUserPost(cri);
	}

	@Override
	public List<PostVO> getFollowingPost(FollowCriteria cri) {
		return postMapper.getFollowingPost(cri);
	}
	

	

}
