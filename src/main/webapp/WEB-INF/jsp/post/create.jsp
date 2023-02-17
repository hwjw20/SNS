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
			<button type="button" id="uploadBtn" class="btn">공유</button>
		</header>
		<section class="">
			<hr>
			<div class="d-flex">
				<input type="file" id="fileInput">
				<textarea cols="55" class="ml-2" style="resize:none" id="contentInput"></textarea>
				
			</div>
			<hr>
			<div class="d-flex justify-content-between">
				<div>고급 설정</div>
				<a class="mr-2"><i class="bi bi-chevron-compact-right"></i></a>
			</div>
		</section> 
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function() {
			
			$("#uploadBtn").on("click", function() {
				
				let content = $("#contentInput").val();
				
				// 파일이 선택되지 않았을때
				if($("#fileInput")[0].files.length == 0) {
					alert("파일을 선택해주세요");
					return;
				}
				
				var formData = new FormData();
				formData.append("content", content);
				formData.append("file", $("#fileInput")[0].files[0]);
				
				$.ajax({
					type:"post"
					, url:"/post/create"
					, data:formData
					, enctype:"multipart/form-data"
					, processData:false
					, contentType:false
					, success:function(data) {
						if(data.result == "success") {
							location.href="/post/timeline/view";
						} else {
							alert("업로드에 실패했습니다.");
						}
					}
					, error:function() {
						alert("업로드 에러");
					}
				});
				
			})
				
			
		});
	</script>
</body>
</html>