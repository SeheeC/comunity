<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
	<meta name="generator" content="Hugo 0.88.1">
	<title>ID / PW 찾기</title>

	<link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sign-in/">



	<!-- Bootstrap core CSS -->
	<link href="/resources/css/bootstrap.min.css" rel="stylesheet">

	<style>
		.bd-placeholder-img {
			font-size: 1.125rem;
			text-anchor: middle;
			-webkit-user-select: none;
			-moz-user-select: none;
			user-select: none;
		}

		@media (min-width: 768px) {
			.bd-placeholder-img-lg {
				font-size: 3.5rem;
			}
		}

		.search-sub {
			float: left;
			list-style: none;
			text-align: center;
			background-color: rgb(33, 37, 41);
			color: white;
		}

		.search-sub a:link {
			text-decoration: none;
			color: white;
		}

		.search-sub a:visited {
			color: white;
		}
	</style>


	<!-- Custom styles for this template -->
	<link href="/resources/css/signin.css" rel="stylesheet">
</head>

<body class="text-center">
	<%@include file="/WEB-INF/views/include/header.jsp" %>

		<div class="container search-nav">
			<ul class="row">
				<li class="col-md-6 search-sub">
					<a href="/member/searchId" class="btn_searchId" id="btn_searchId">아이디 찾기</a>
				</li>

				<li class="col-md-6 search-sub">
					<a href="/member/searchPw" class="btn_searchPw" id="btn_searchPw">비밀번호 찾기</a>
				</li>
			</ul>
		</div>

		<main class="container">
			<div class="row searchId" id="searchId">
				<h3>아이디 찾기</h3>
				<div class="container">
					<form>
						<div class="form-group row">
							<div class="col-md-6">
								<label for="user_nm">이름</label>
								<input type="text" class="form-control" id="user_nm" name="user_nm">
							</div>
							<div class="col-sm-6">
							<label for="user_email" class="col-sm-2 col-form-label">이메일 입력</label>
								<input type="text" class="form-control" id="user_email" name="user_email"
									placeholder="회원 가입 시 입력했던 이메일을 입력해 주세요.">
							</div>
						</div>

						<div class="form-group row">
							<div class="col-sm-12">
								<button type="button" id="btn_idMailSend" class="btn btn-primary">메일전송하기</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</main>

		<script>

			$(document).ready(function(){

				$("#btn_searchId").on("click", function(){
					location.href = "/member/searchId";
				});

				$("#btn_searchPw").on("click", function(){
					location.href = "/member/searchPw";
				});

				$("#searchPw").hide();
				
				$("#btn_searchId").on("click", function(){
					$("#searchPw").hide();
					$("#searchId").show();
				});

				$("#btn_searchPw").on("click", function(){
					$("#searchPw").show();
					$("#searchId").hide();
				});
				
				// 아이디 찾기
				$("#btn_idMailSend").on("click", function(){
					
					let user_email = $("#user_email");
					let user_nm = $("#user_nm");

					if(user_nm.val() == "" || user_nm.val() == null){
						alert("이름을 입력해 주세요.");
						user_nm.focus();
						return;
					}else if(user_email.val() == "" || user_email.val() == null){
						alert("가입하신 이메일을 입력해 주세요.");
						user_email.focus();
						return;
					}

					$.ajax({
						url: '/member/searchId',
						type: 'post',
						dataType: 'text',
						data: { 
							user_nm : user_nm.val(),
							user_email : user_email.val()
						},
						success: function(data){
							if(data == "success"){
								alert("아이디를 작성하신 이메일로 보냈습니다.\n메일을 확인해 주세요.");
							}else if(data == "fail"){
								alert("메일 발송이 실패했습니다. 다시 진행해 주세요.\n문제 발생 시 관리자에게 연락 주세요.");
							}else if(data == "noMail"){
								alert("가입한 이메일 정보가 없습니다. 다시 확인해 주세요.")
							}else if(data == "noNm"){
								alert("가입한 이메일과 일치하는 이름이 없습니다. 확인해 주세요.")
							}
						}
					}); // ajax 종료

				}); // btn_IdMailSend 종료

			}); // 끝
		</script>
</body>

</html>