package com.jiwon.sns.post.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiwon.sns.post.dao.PostDAO;
import com.jiwon.sns.post.model.Post;

@Service
public class PostBO {

	@Autowired
	private PostDAO postDAO;
	
	public List<Post> getPostList() {
		
		return postDAO.selectPostList();
	}
}
