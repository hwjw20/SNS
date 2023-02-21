<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타임라인</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

	<script
	  src="https://code.jquery.com/jquery-3.6.3.min.js"
	  integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
	  crossorigin="anonymous"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  	
  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
  	
  	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		<section class="pt-2">
			<div class="card-list">
			
				<c:forEach var="post" items="${postList}">
				<div class="card mb-2">
					<div id="loginIdHeader" class="d-flex justify-content-between">
						<h4 class="ml-2"><a href="#">${post.loginId}</a></h4>
						<a href="#" class="mr-2 pt-2"><i class="bi bi-three-dots"></i></a>
					</div>
					
					<div id="postDiv">
						<img src="${post.imagePath}" width="400" height="250">
					</div>
					
					<div id="commentDiv" class="pt-2">
						<div class="d-flex ml-2">
							<a href="#" class="heart-btn" data-post-id="${post.id}"><i class="bi bi-heart"></i></a>
							<div class="ml-2">좋아요 ${post.countLike}개</div>
						</div>
						<div>
							<span class="ml-2"><b>eee</b></span>
							<span>${post.content}</span>
						</div>
						<hr>
						<div class="mt-2">
							<div class="text-secondary small ml-2">댓글</div>
							<span><b>damee</b></span>
							<span>...</span>
							
							
						</div>
						
						<div class="input-group mt-4">
							<input type="text" class="form-control" placeholder="내용을 입력해주세요." id="commentInput${post.id}">
							<button class="btn btn-outline-secondary comment-btn" type="button" data-post-id="${post.id}">게시</button>
						</div>
						<div class="mt-2 d-none" id="nonComment">댓글을 입력해주세요.</div>
						
					</div>
				</div>
				</c:forEach>
			</div>
			
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function() {
			
			
			$(".heart-btn").on("click", function() {

				// 해당하는 버튼의 postId를 얻어온다.
				let postId = $(this).data("post-id");
				
				$.ajax({
					type:"get"
					, url:"/post/like"
					, data:{"postId":postId}
					, success:function(data) {
						if(data.result == "success") {
							location.reload();
						} else {
							alert("좋아요 실패");
						}
					}
					, error:function() {
						alert("좋아요 에러");
					}
					
				});
				
			});
			
			$(".comment-btn").on("click", function() {
				
				let postId = $(this).data("post-id");
				//let comment = $("#commentInput" + postId).val();
				
				let comment = $(this).prev().val();
				
				$.ajax({
					type:"post"
					, url:"/post/comment/create"
					, data:{"postId":postId, "content":comment}
					, success:function(data) {
						if(data.result == "success") {
							location.reload();
						} else {
							alert("댓글 작성 실패");
						}
					}
					, error:function() {
						alert("댓글 작성 에러");
					}
				});
				
				
				
				
			});
		});
	</script>
</body>
</html>