package com.jiwon.sns.post.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiwon.sns.post.like.dao.LikeDAO;

@Service
public class LikeBO {
	
	@Autowired
	private LikeDAO likeDAO;
	
	
	// 좋아요 기능
	public int addLike(int userId, int postId) {
		return likeDAO.insertLike(userId, postId);
	}
	
	public int countLike(int postId) {
		return likeDAO.selectCountLike(postId);
	}
	
	public boolean isLike(int userId, int postId) {
		int count = likeDAO.selectCountLikeByUserId(userId, postId);
		if(count == 1) {
			return true;
		} else {
			return false;
		}
	}
}
