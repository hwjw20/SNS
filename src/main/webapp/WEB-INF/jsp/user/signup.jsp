<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
		<header style="background-color:#dfe2e6">
			<h1 class="pt-2 pl-3">Pingstagram</h1>
		</header>
		<section class="d-flex align-contents-center mt-2">
			<div class="join-box text-center margin pt-5 pl-5 pr-5" style="background-color:#f7f7f7">
				<div class="input-group mb-3">
					<input type="text" class="form-control" placeholder="아이디" id="idInput">
					<button class="btn btn-primary" type="button" id="duplicateBtn">중복확인</button>
				</div>
				
				<div class="d-none text-danger small" id="availableDiv">사용가능한 아이디입니다.</div>
				<div class="d-none text-danger small" id="duplicateDiv">중복된 아이디입니다.</div>
				
				<input type="password" class="form-control mt-4" id="passwordInput" placeholder="비밀번호">
				<input type="password" class="form-control mt-4" id="passwordConfirmInput" placeholder="비밀번호 확인">
				<input type="text" class="form-control mt-4" id="nameInput" placeholder="이름">
				<input type="text" class="form-control mt-4" id="emailInput" placeholder="이메일">
				
				<button type="button" class="btn btn-primary mt-3" id="signupBtn">회원가입</button>
			</div>
		</section>
		<footer class="text-center">
			<hr>
			<div>Copyright © Pingstagram 2023</div>
		</footer>
	</div>
	
	<script>
		$(document).ready(function() {
			var isChecked = false;
			var isDuplicate = true;
			
			$("#idInput").on("input", function() {
				isChecked = false;
				isDuplicate = true;
				
				$("#duplicateDiv").addClass("d-none");
				$("#availableDiv").addClass("d-none");
			});
			
			$("#duplicateBtn").on("click", function() {
				let id = $("#idInput").val();
				
				if(id == "") {
					alert("아이디를 입력하세요.");
					return;
				}
				
				$.ajax({
					type:"get"
					, url:"/user/duplicate_id"
					, data:{"loginId":id}
					, success:function(data) {
						isChecked = true;
						
						if(data.is_duplicate) {
							isDuplicate = true;
							
							$("#duplicateDiv").removeClass("d-none");
							$("#availableDiv").addClass("d-none");
						} else {
							isDuplicate = false;
							
							$("#duplicateDiv").addClass("d-none");
							$("#availableDiv").removeClass("d-none");
						}
					}
					, error:function() {
						alert("아이디 중복확인 에러");
					}
				
				});
				
			});
			
			
			$("#signupBtn").on("click", function() {
				let id = $("#idInput").val();
				let password = $("#passwordInput").val();
				let passwordConfirm = $("#passwordConfirmInput").val();
				let name = $("#nameInput").val();
				let email = $("#emailInput").val();
				
				if(id == "") {
					alert("아이디를 입력하세요.");
					return;
				}
				if(password == "") {
					alert("비밀번호를 입력하세요.");
					return;
				}
				if(password != passwordConfirm) {
					alert("비밀번호가 일치하지 않습니다.");
					return;
				}
				if(name == "") {
					alert("이름을 입력하세요.");
					return;
				}
				if(email == "") {
					alert("이메일을 입력하세요.");
					return;
				}
				if(!isChecked) {
					alert("아이디 중복확인을 해주세요.");
					return;
				}
				if(isDuplicate) {
					alert("중복된 아이디입니다.");
					return;
				}
				
				$.ajax({
					type:"post"
					, url:"/user/signup"
					, data:{"loginId":id, "password":password, "name":name, "email":email}
					, success:function(data) {
						if(data.result == "success") {
							location.href="/user/signin/view";
						} else {
							alert("회원가입에 실패하였습니다.");
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