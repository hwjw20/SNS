<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
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
		<header>
		</header>
		<section class="d-flex align-contents-center mt-2">
			<div class="join-box text-center margin pt-2 pl-5 pr-5" style="background-color:#f7f7f7">
				<h1 class="mt-2">lock</h1>
				<div class="mt-3">로그인에 문제가 있나요?</div>
				<div class="small mt-2">사용자 이름 또는 이메일을 입력하면 다시 계정에 <br>로그인할 수 있는 링크를 보내드립니다.</div>
				
				<input type="text" class="form-control mt-2" placeholder="아이디" id="idInput">
				<input type="text" class="form-control mt-2" placeholder="사용자 이름" id="nameInput">
				<input type="text" class="form-control mt-2" placeholder="이메일" id="emailInput">
				<button type="button" class="btn btn-primary mt-2 btn-block" id="searchBtn">다음</button>
				
				<div class="small mt-2">또는</div>
				<hr>
				<div class="text-primary"><a href="#">페이스북으로 로그인</a></div>
			</div>
		</section>
		<footer class="text-center">
			<hr>
			<div>Copyright © Pingstagram 2023</div>
		</footer>
	</div>
	
	<script>
		$(document).ready(function() {
			$("#searchBtn").on("click", function() {
				let id = $("#idInput").val();
				let name = $("#nameInput").val();
				let email = $("#emailInput").val();
				
				if(id == "") {
					alert("아이디를 입력하세요.");
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
				
				$.ajax({
					type:"get"
					, url:"/user/searchPw"
					, data:{"loginId":id, "name":name, "email":email}
					, success:function(data) {
						if(data.exist) {
							alert("이메일에 새로운 비밀번호 변경 링크를 보냈습니다.");
							location.href="/user/signin/view";
						} else {
							alert("이름과 이메일이 일치하는 정보가 없습니다.");
						}
					}
					, error:function() {
						alert("비밀번호 찾기 에러");
					}
				});
			});
		});
	
	</script>
</body>
</html>