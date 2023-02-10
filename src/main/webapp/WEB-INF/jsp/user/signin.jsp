<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

	<script
	  src="https://code.jquery.com/jquery-3.6.3.min.js"
	  integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
	  crossorigin="anonymous"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  	
  	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id="wrap">
		<header></header>
		<section class="d-flex align-contents-center">
			<div class="join-box text-center">
				<h2 class="text-center">Pingstagram</h2>
				
				<input type="text" class="form-control mt-4" id="idInput" placeholder="아이디">
				<input type="password" class="form-control mt-2" id="passwordInput" placeholder="비밀번호">
				<div class="float-right mt-2"><a href="#">비밀번호를 잊으셨나요?</a></div> <br>
				
				<button type="button" class="btn btn-success mt-3" id="loginBtn">로그인</button>
				<div class="text-center">또는</div>
				<div class="mt-3"><a href="#">페이스북으로 로그인</a></div>
			</div>
		</section>
		<footer class="text-center">
			<hr>
			<div>계정이 없으신가요? <a href="/user/signup/view">가입하기</a></div>
		</footer>
	</div>
	
	<script>
		$(document).ready(function() {
			
			$("#loginBtn").on("click", function() {
				let id = $("#idInput").val();
				let password = $("#passwordInput").val();
				
				if(id == "") {
					alert("아이디를 입력하세요.");
					return;
				}
				if(password == "") {
					alert("비밀번호를 입력하세요.");
					return;
				}
				
				$.ajax({
					type:"post"
					, url:"/user/signin"
					, data:{"loginId":id, "password":password}
					, success:function(data) {
						if(data.result == "success") {
							location.href="/post/timeline/view";
						} else {
							alert("아이디 또는 비밀번호를 확인하세요.");
						}
					}
					, error:function() {
						alert("에러");
					}
				
				});
			});
		});
	</script>
	
</body>
</html>