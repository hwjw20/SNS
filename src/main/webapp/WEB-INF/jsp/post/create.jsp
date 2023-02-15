<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

	<script
	  src="https://code.jquery.com/jquery-3.6.3.min.js"
	  integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
	  crossorigin="anonymous"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
  	
  	<link rel="stylesheet" href="/static/css/createViewStyle.css" type="text/css">
</head>
<body>
	<div id="wrap" class="">
		<header class="d-flex justify-content-between pt-4">
			<a href="/post/timeline/view" class="ml-2"><i class="bi bi-chevron-compact-left"></i></a>
			<h4>새 게시물</h4>
			<a href="/post/timeline/view" class="mr-2">공유</i></a>
		</header>
		<section class="">
			<hr>
			<div class="d-flex">
				<div class="img-box bg-secondary"></div>
				<textarea cols="55" class="ml-2" style="resize:none"></textarea>
				
			</div>
			<hr>
			<div class="d-flex justify-content-between">
				<div>사람 태그하기</div>
				<a class="mr-2"><i class="bi bi-chevron-compact-right"></i></a>
			</div>
			<hr>
			<div class="d-flex justify-content-between">
				<div>위치 추가</div>
				<a class="mr-2"><i class="bi bi-chevron-compact-right"></i></a>
			</div>
			<hr>
			<div class="d-flex justify-content-between">
				<div>음악 추가</div>
				<a class="mr-2"><i class="bi bi-chevron-compact-right"></i></a>
			</div>
			<hr>
			<div class="d-flex justify-content-between">
				<div>고급 설정</div>
				<a class="mr-2"><i class="bi bi-chevron-compact-right"></i></a>
			</div>
		</section> 
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
</body>
</html>