package com.jiwon.sns.post;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jiwon.sns.post.bo.PostBO;
import com.jiwon.sns.post.model.Post;
import com.jiwon.sns.post.model.PostDetail;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
@Controller
@RequestMapping("/post")
public class PostController {
	
	@Autowired
	private PostBO postBO;
	
	@GetMapping("/create/view")
	public String createPost() {
		return "post/create";
	}
	
	// 타임라인
	@GetMapping("/timeline/view")
	public String timeline(
			Model model) {
		
		List<PostDetail> postList = postBO.getPostList();
		
		
		model.addAttribute("postList", postList);
		
		return "post/timeline";
	}
	
	
}
