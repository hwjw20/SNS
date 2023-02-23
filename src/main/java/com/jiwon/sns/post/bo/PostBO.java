package com.jiwon.sns.post.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jiwon.sns.common.FileManagerService;
import com.jiwon.sns.post.comment.bo.CommentBO;
import com.jiwon.sns.post.comment.model.CommentDetail;
import com.jiwon.sns.post.dao.PostDAO;
import com.jiwon.sns.post.like.bo.LikeBO;
import com.jiwon.sns.post.model.Post;
import com.jiwon.sns.post.model.PostDetail;
import com.jiwon.sns.user.bo.UserBO;
import com.jiwon.sns.user.model.User;

@Service
public class PostBO {

	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private UserBO userBO;
	
	@Autowired
	private LikeBO likeBO;
	
	@Autowired
	private CommentBO commentBO;
	
	// 타임라인
	public List<PostDetail> getPostList(int loginUserId) {
		
		List<Post> postList = postDAO.selectPostList();
		
		// 생성된 postDetail 객체를 리스트로 구성한다.
		List<PostDetail> postDetailList = new ArrayList<>();
		for(Post post : postList) {
			// postDetail 객체를 생성하고, post 객체의 정보를 저장한다.
			PostDetail postDetail = new PostDetail();
			// loginId 값을 저장한다.

			int userId = post.getUserId();
			int postId = post.getId();
			User user = userBO.getUserInfo(userId);
			int countLike = likeBO.countLike(postId);
			boolean isLike = likeBO.isLike(loginUserId, postId);
			List<CommentDetail> commentList = commentBO.getCommentList(postId);
			
			
			postDetail.setId(postId);
			postDetail.setUserId(userId);
			postDetail.setLoginId(user.getLoginId());
			postDetail.setContent(post.getContent());
			postDetail.setImagePath(post.getImagePath());
			postDetail.setCountLike(countLike);
			postDetail.setLike(isLike);
			postDetail.setCommentList(commentList);
			
			postDetailList.add(postDetail);
		}
		
		return postDetailList;
	}
	
	// 게시물 작성
	public int addPost(int userId, String content, MultipartFile file) {
		// 파일을 저장하고, 접근 경로를 만든다.
		
		String imagePath = FileManagerService.saveFile(userId, file);
		
		return postDAO.insertPost(userId, content, imagePath);
	}
	
	public List<String> getImgById(int userId) {
		return postDAO.selectImgList(userId);
	}
	
	public int deletePost(int postId, int userId) {

		Post post = postDAO.selectPost(postId);
		
		// 대상 post 삭제
		int count = postDAO.deletePost(postId, userId);
		if(count == 1) {
			FileManagerService.removeFile(post.getImagePath());
			
			// 댓굴 삭제
			commentBO.deleteCommentByPostId(postId);
			
			// 좋아요 삭제
			likeBO.deleteLikeByPostId(postId);
		}
		
		return count;
	}
	
}
