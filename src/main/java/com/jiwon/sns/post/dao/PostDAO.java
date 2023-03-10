package com.jiwon.sns.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.jiwon.sns.post.model.Like;
import com.jiwon.sns.post.model.Post;

@Repository
public interface PostDAO {
	

	public int insertPost(
			@Param("userId") int userId
			, @Param("content") String content
			, @Param("imagePath") String imagePath);

	public List<Post> selectPostList();
	
	public List<String> selectImgList(@Param("userId") int userId);
	
	public Post selectPost(@Param("postId") int postId);
	
	public int deletePost(
			@Param("postId") int postId
			, @Param("userId") int userId);
}