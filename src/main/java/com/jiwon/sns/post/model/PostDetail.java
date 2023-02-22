package com.jiwon.sns.post.model;

import java.util.List;

import com.jiwon.sns.post.comment.model.CommentDetail;

public class PostDetail {

	private int id;
	private int userId;
	private String loginId;
	private String content;
	private String imagePath;
	private int countLike;
	private boolean isLike;
	private List<CommentDetail> commentList;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public int getCountLike() {
		return countLike;
	}
	public void setCountLike(int countLike) {
		this.countLike = countLike;
	}
	public boolean isLike() {
		return isLike;
	}
	public void setLike(boolean isLike) {
		this.isLike = isLike;
	}
	public List<CommentDetail> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<CommentDetail> commentList) {
		this.commentList = commentList;
	}
	
	
}
