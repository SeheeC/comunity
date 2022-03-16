<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
	<!doctype html>
	<html lang="en">

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
		<meta name="generator" content="Hugo 0.88.1">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
		<title>나의 정보</title>

		<link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sign-in/">


		<!-- 		<!-- Bootstrap core CSS -->
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

			.form-row, .row, .form-group {
				margin-bottom: 30px;
			}

			.control-label {
				padding: 0;
			}

			#btn_join {
				margin-top: 50px;
			}

			.fa-star-of-life {
				margin-right: 10px;
			}

			#btn_userid_chk {
				vertical-align: middle;
			}

			.my-posting ul li{
				float: left;
				list-style: none;
				text-align: center;
			}

			.my-posting ul li a:link{
				text-decoration: none;
				color: black;
				font-weight: bold;
			}
			
			.my-posting ul li a:visited{
				color: black;
				font-weight: bold;
			}
		</style>


		<!-- Custom styles for this template -->
		<link href="/resources/css/signin.css" rel="stylesheet">
	</head>

	<body class="text-center">
		<%@include file="/WEB-INF/views/include/header.jsp" %>

			<main class="form-signin">
				<form action="/member/join" method="post" id="joinForm">
					<!-- <img class="mb-4" src="../assets/brand/bootstrap-logo.svg" alt="" width="72" height="57"> -->
					<h1 class="h3 mb-3 fw-normal">나의 정보</h1>

					<div class="form-row">
						<div class="col-md-12">
							<label for="user_id">아이디</label>
							<input type="text" class="form-control" id="user_id" name="user_id"
								value='<c:out value="${memberVO.user_id }" />' readonly>
						</div>
					</div>
					<div class="form-group">
						<label for="user_nm">이름</label>
						<input type="text" class="form-control" id="user_nm" name="user_nm"
							value='<c:out value="${memberVO.user_nm }" />' readonly>
					</div>
					<div class="form-group">
						<label for="user_nick">닉네임</label>
						<input type="text" class="form-control" id="user_nick" name="user_nick"
							value='<c:out value="${memberVO.user_nick }" />' readonly>
					</div>
					<div class="form-row">
						<div class="col-md-12">
							<label for="user_email">전자우편</label>
							<input type="text" class="form-control" id="user_email" name="user_email"
								value='<c:out value="${memberVO.user_email }" />' readonly>
						</div>
					</div>

					<div class="row">
						<div class="col-md-5">
							<label for="addr_front">기본주소</label>
							<input type="text" class="form-control" id="addr_front" name="addr_front"
								value='<c:out value="${memberVO.addr_front }" />' readonly>
						</div>
						<div class="col-md-5">
							<label for="addr_back">나머지주소</label>
							<input type="text" class="form-control" id="addr_back" name="addr_back"
								value='<c:out value="${memberVO.addr_back }" />' readonly>
							<input type="hidden" id="sample2_extraAddress" placeholder="참고항목">
						</div>
						<div class="col-md-2">
							<label for="addr_no">우편번호</label>
							<input type="text" class="form-control" id="addr_no" name="addr_no"
								value='<c:out value="${memberVO.addr_no }" />' readonly>
						</div>

					</div>

					<div class="form-group">
						<label for="phone_no">전화번호</label>
						<input type="text" class="form-control" id="phone_no" name="phone_no"
							value='<c:out value="${memberVO.phone_no }" />' readonly>
					</div>

					<div class="row">
						<div class="col-md-6">
							<label for="email_chk">메일 수신 여부</label>
							<input type="text" class="form-control" id="email_chk" name="email_chk"
								value='<c:out value="${memberVO.email_chk == ' Y' ? '가능' : '불가능' }" />' readonly>
						</div>
						<div class="col-md-6">
							<label for="reg_date">가입 날짜</label>
							<input type="text" class="form-control" id="reg_date" name="reg_date"
								value='<c:out value="${memberVO.reg_date }" />' readonly>
						</div>
					</div>

					<nav class="my-posting">
						<ul class="row">
							<li class="col-md-4">
								<a class="my_post" href="#">나의 게시글</a>
								<span>(개수)</span>
							</li>
							<li class="col-md-4">
								<a class="my_cmt" href="#">나의 댓글</a>
								<span>(개수)</span>
							</li>
							<li class="col-md-4">
								<a class="my_itr" href="#">나의 관심 글</a>
								<span>(개수)</span>
							</li>
						</ul>
					</nav>

					<hr>
					<div class="row">
						<div class="col-md-4">
							<label for="cur_userPw">현재 비밀번호</label>
							<input type="password" class="form-control" id="cur_userPw" name="cur_userPw">
						</div>
						<div class="col-md-4">
							<label for="cng_userPw">변경 비밀번호</label>
							<input type="password" class="form-control" id="cng_userPw" name="cng_userPw">
						</div>
						<div class="col-md-4">
							<label for="cur_userPw">&nbsp;</label>
							<button type="button" class="form-control" id="btn_changePw">비밀번호 변경</button>
						</div>
					</div>

					<div class="row">
						<div class="col-md-12">
							<a href="/member/modify"><input type="button" value="회원 정보 수정하기"></a>
						</div>
					</div>

					<div class="row">
						<div class="col-md-6">
							<label for="user_pw">현재 비밀번호</label>
							<input type="password" class="form-control" id="user_pw" name="user_pw">
						</div>
						<div class="col-md-6">
							<label for="btn_RegDelete">&nbsp;</label>
							<button type="button" class="form-control" id="btn_RegDelete">회원 탈퇴</button>
						</div>
					</div>
				</form>				
			</main>
			<%@ include file="/WEB-INF/views/include/footer.jsp" %>

			<script>

				$(document).ready(function () {
					// 비밀번호 변경
					$("#btn_changePw").on("click", function(){
						
						let cur_userPw = $("#cur_userPw");
						let cng_userPw = $("#cng_userPw");
						let pw_reg = RegExp(/(?=.*[0-9a-zA-ZS])(?=.*?[#?!@$%^&*-]).{8,24}/);

						if(cur_userPw.val() == "" || cur_userPw.val() == null){
							alert("현재 비밀번호를 입력해 주세요.");
							cur_userPw.focus();
							return;
						}

						if(cng_userPw.val() == "" || cng_userPw.val() == null){
							alert("변경할 비밀번호를 입력해 주세요.");
							cng_userPw.focus();
							return;
						}
						
						// 아이디와 동일한지 여부 검사
						if($("#user_id").val() == $("#cng_userPw").val()){
							alert("아이디와 비밀번호를 동일하게 입력할 수 없습니다.");
							$("#cng_userPw").val("");
							cng_userPw.focus();
							return;
						}
						
						// 비밀번호 유효성 검사
						if(!pw_reg.test($("#cng_userPw").val())){
							alert("영어 대소문자, 숫자를 이용하여 특수문자(#?!@$%^&*-)를 포함해서 비밀번호를 입력해 주세요.");
							cng_userPw.focus();
							return;
						}

						$.ajax({
							url: '/member/changePw',
							type: 'post',
							dataType: 'text',
							data: { cur_userPw : cur_userPw.val(), cng_userPw : cng_userPw.val()},
							success: function(data){
								if(data == "success"){
									alert("비밀번호 변경을 성공했습니다.");
								}else if(data == "noPw"){
									alert("현재 비밀번호가 다릅니다.");
									cur_userPw.val("");
									cur_userPw.focus();
								}
							}
						});
					});

					//회원 탈퇴
					$("#btn_RegDelete").on("click", function(){
						let user_pw = $("#user_pw");

						if(user_pw.val() == "" || user_pw.val() == null){
							alert("현재 비밀번호를 입력해 주세요.");
							user_pw.focus();
							return;
						}
					

						$.ajax({
							url: '/member/regDelete',
							type: 'post',
							dataType: 'text',
							data: { user_pw : user_pw.val() },
							success: function(data){
								if(data == "1"){
									alert("회원 탈퇴가 되었습니다.");
									location.href = "/";
								}else if(data == "0"){
									alert("현재 비밀번호가 다릅니다. 확인해 주세요.");
									user_pw.val("");
									user_pw.focus();		
								}
							}	
						});
					});

				}); // script 끝

			</script>


	</body>

	</html>