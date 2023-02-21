package com.jiwon.sns.post.comment.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.jiwon.sns.post.comment.model.Comment;

@Repository
public interface CommentDAO {

	public int insertComment(
			@Param("userId") int userId
			, @Param("postId") int postId
			, @Param("content") String content);
	
	public Comment selectComment(@Param("postId") int postId);
}
