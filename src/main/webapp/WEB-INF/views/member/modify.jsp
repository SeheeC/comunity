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

			div {
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

		</style>


		<!-- Custom styles for this template -->
		<link href="/resources/css/signin.css" rel="stylesheet">
	</head>
	<script>

		let msg = '${msg}';
		if (msg == 'modifyFail') {
			alert("비밀번호를 확인 바랍니다.");
		}

	</script>

	<body class="text-center">
		<%@include file="/WEB-INF/views/include/header.jsp" %>

			<main class="form-signin">
				<form action="/member/modify" method="post" id="modifyForm">
					<!-- <img class="mb-4" src="../assets/brand/bootstrap-logo.svg" alt="" width="72" height="57"> -->
					<h1 class="h3 mb-3 fw-normal">나의 정보</h1>

					<div class="form-row">
						<div class="col-md-12">
							<label for="user_id">아이디</label>
							<input type="text" class="form-control" id="user_id" name="user_id"
								value='<c:out value="${memberVO.user_id }" />' readonly>
						</div>
					</div>
					<div class="form-row">
						<div class="col-md-12">
							<label for="user_pw">비밀번호</label>
							<input type="password" class="form-control" id="user_pw" name="user_pw"
							value='<c:out value="${memberVO.user_pw }" />' readonly>
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
							value='<c:out value="${memberVO.user_nick }" />'>
					</div>
					<div class="form-row">
						<div class="col-md-12">
							<label for="user_email">전자우편</label>
							<input type="text" class="form-control" id="user_email" name="user_email"
								value='<c:out value="${memberVO.user_email }" />'>
						</div>
					</div>

					<div class="row">
						<div class="col-md-4">
							<label for="addr_front">기본주소</label>
							<input type="text" class="form-control" id="addr_front" name="addr_front"
								value='<c:out value="${memberVO.addr_front }" />'>
						</div>
						<div class="col-md-3">
							<label for="addr_back">나머지주소</label>
							<input type="text" class="form-control" id="addr_back" name="addr_back"
								value='<c:out value="${memberVO.addr_back }" />'>
							<input type="hidden" id="sample2_extraAddress" placeholder="참고항목">
						</div>
						<div class="col-md-2">
							<label for="addr_no">우편번호</label>
							<input type="text" class="form-control" id="addr_no" name="addr_no"
								value='<c:out value="${memberVO.addr_no }" />'>
						</div>
						<div class="col-md-3">
					      <label for="btnPostCode">&nbsp;</label>
					      <input type="button" class="form-control" id="btnPostCode" name="btnPostCode"  value="우편번호찾기" onclick="sample2_execDaumPostcode()">
					    </div>

					</div>

					<div class="form-group">
						<label for="phone_no">전화번호</label>
						<input type="text" class="form-control" id="phone_no" name="phone_no"
							value='<c:out value="${memberVO.phone_no }" />'>
					</div>

					<div class="row">
						<div class="col-md-6">
							<label for="email_chk">메일 수신 여부</label>
							<input type="text" class="form-control" id="email_chk" name="email_chk"
								value='<c:out value="${memberVO.email_chk == ' Y' ? '가능' : '불가능' }" />'>
						</div>
						<div class="col-md-6">
							<label for="reg_date">가입 날짜</label>
							<input type="text" class="form-control" id="reg_date" name="reg_date"
								value='<c:out value="${memberVO.reg_date }" />' readonly>
						</div>
					</div>

					<hr>

					<div class="row">
						<div class="col-md-6">
							<label for="user_RePw">현재 비밀번호</label>
							<input type="password" class="form-control" id="user_RePw" name="user_RePw">
						</div>
						<div class="col-md-6">
							<button type="button" id="btn_modify" class="btn btn-primary">회원 정보 수정하기</button>
						</div>
					</div>


				</form>
			</main>

			<script>

				$(document).ready(function(){
					
					$("#btn_modify").on("click", function(){
						let user_pw = $("#user_pw");
						let user_RePw = $("#user_RePw");

						if(user_RePw.val() == "" || user_RePw.val() == null){
							alert("비밀번호를 입력해 주세요.");
							user_RePw.focus();
							return;
						}else if(user_pw.val() != user_RePw.val()){
							alert("비밀번호가 일치하지 않습니다.");
							user_RePw.focus();
							return;
						}

						$("#modifyForm").submit();
					});

				}); // script 끝

			</script>

			<!--우편번호 DAUM API-->
			<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
			<div id="layer"
				style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
				<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer"
					style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()"
					alt="닫기 버튼">
			</div>

			<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			<script>
				// 우편번호 찾기 화면을 넣을 element
				var element_layer = document.getElementById('layer');

				function closeDaumPostcode() {
					// iframe을 넣은 element를 안보이게 한다.
					element_layer.style.display = 'none';
				}

				function sample2_execDaumPostcode() {
					new daum.Postcode({
						oncomplete: function (data) {
							// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== '' && data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								document.getElementById("sample2_extraAddress").value = extraAddr;

							} else {
								document.getElementById("sample2_extraAddress").value = '';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('addr_no').value = data.zonecode;
							document.getElementById("addr_front").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("addr_back").focus();

							// iframe을 넣은 element를 안보이게 한다.
							// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
							element_layer.style.display = 'none';
						},
						width: '100%',
						height: '100%',
						maxSuggestItems: 5
					}).embed(element_layer);

					// iframe을 넣은 element를 보이게 한다.
					element_layer.style.display = 'block';

					// iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
					initLayerPosition();
				}

				// 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
				// resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
				// 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
				function initLayerPosition() {
					var width = 300; //우편번호서비스가 들어갈 element의 width
					var height = 400; //우편번호서비스가 들어갈 element의 height
					var borderWidth = 5; //샘플에서 사용하는 border의 두께

					// 위에서 선언한 값들을 실제 element에 넣는다.
					element_layer.style.width = width + 'px';
					element_layer.style.height = height + 'px';
					element_layer.style.border = borderWidth + 'px solid';
					// 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
					element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width) / 2 - borderWidth) + 'px';
					element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height) / 2 - borderWidth) + 'px';
				}
			</script>


	</body>

	</html>