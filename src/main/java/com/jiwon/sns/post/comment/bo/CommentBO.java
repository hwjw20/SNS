package com.jiwon.sns.post.comment.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiwon.sns.post.comment.dao.CommentDAO;
import com.jiwon.sns.post.comment.model.Comment;

@Service
public class CommentBO {

	@Autowired
	private CommentDAO commentDAO;
	
	public int addComment(int userId, int postId, String content) {
		return commentDAO.insertComment(userId, postId, content);
	}
	
	public Comment getComment(int postId) {
		return commentDAO.selectComment(postId);
	}
	
}
