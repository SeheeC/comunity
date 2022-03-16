<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!doctype html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
	<meta name="generator" content="Hugo 0.88.1">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
	<title>회원 가입</title>

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

		.row {
			padding-top: 50px;
		}

		.control-label {
			padding: 0;
		}

		#btn_join {
			margin-top: 50px;
		}

		.fa-star-of-life{
			margin-right: 10px;
		}
		
		#btn_userid_chk{
			vertical-align: middle;
		}
	</style>


	<!-- Custom styles for this template -->
	<link href="/resources/css/signin.css" rel="stylesheet">
</head>

<body class="text-center">
<%@include file="/WEB-INF/views/include/header.jsp" %>
<div class="container">
	<main class="form-signin">
		<form action="/member/join" method="post" id="joinForm" onsubmit="return idPwChks()">
			<!-- <img class="mb-4" src="../assets/brand/bootstrap-logo.svg" alt="" width="72" height="57"> -->
			<h1 class="h3 mb-3 fw-normal">회원 가입</h1>

			<div class="row">
				<div class="col-md-8">
					<i class="fa-solid fa-star-of-life fa-xs"></i><label style="font-size: 9pt;" for="userId_state" name="userId_state">ID는 영어 대소문자, 숫자만 5~15자로 입력해 주세요.</label>
					<input type="text" class="form-control" id="user_id" name="user_id" placeholder="아이디를 생성하세요.">
				</div>
				<div class="col-md-4">
					<button type="button" class="form-control" id="btn_userid_chk">아이디 중복 확인</button>
				</div>
			</div>
			<div class="row">
				<i class="fa-solid fa-star-of-life fa-xs"></i><label for="user_pw" id="userpwChk_state">비밀번호를 생성하세요.</label>
				<p style="font-size: 9pt;">비밀번호는 영어 대소문자, 특수문자(#?!@$%^&*-)를 사용하여 8~24자리로 만들어 주세요.</p>
				<input type="password" class="form-control" id="user_pw" name="user_pw">
			</div>
			<div class="row">
				<i class="fa-solid fa-star-of-life fa-xs"></i><label for="user_pw2" id="userPw2_state">비밀번호를 동일하게 입력해 주세요.</label>
				<input type="text" class="form-control" id="user_pw2">
				<button type="button" class="form-control" id="btn_userpw_chk">비밀번호 확인</button>
			</div>
			<div class="form-group row">
				<i class="fa-solid fa-star-of-life fa-xs"></i><label for="user_nm" id="userNm_state">이름을 입력해 주세요.</label>
				<input type="text" class="form-control" id="user_nm" name="user_nm" placeholder="">
			</div>
			<div class="form-group row">
				<i class="fa-solid fa-star-of-life fa-xs"></i><label for="user_nick" id="userNick_state">닉네임을 입력해 주세요.</label>
				<input type="text" class="form-control" id="user_nick" name="user_nick" placeholder="">
			</div>
			<div class="row">
				<div class="col-md-6">
					<i class="fa-solid fa-star-of-life fa-xs"></i><label for="user_email" name="userEmail_state">이메일을 입력해 주세요.</label>
					<input type="text" class="form-control" id="user_email" name="user_email">
				</div>
				<div class="col-md-2">
					<button type="button" class="form-control" id="btn_useremail_chk">메일 인증 요청</button>
				</div>
				<div class="col-md-2">
					<label for="user_email_code">메일 인증 코드 입력</label>
					<input type="text" class="form-control" id="user_email_code" name="user_email_code">
				</div>
				<div class="col-md-2">
					<label id="user_email_chkstate">&nbsp;</label>
					<button type="button" class="form-control" id="btn_usermail">메일 인증 확인</button>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<label for="addr_front">기본 주소</label>
					<input type="text" class="form-control" id="addr_front" name="addr_front">
				</div>
				<div class="col-md-4">
					<label for="addr_back">상세 주소</label>
					<input type="text" class="form-control" id="addr_back" name="addr_back">
					<input type="hidden" id="sample2_extraAddress" placeholder="참고항목">
				</div>
				<div class="col-md-2">
					<label for="addr_no">우편번호</label>
					<input type="text" class="form-control" id="addr_no" name="addr_no">
				</div>
				<div class="col-md-2">
					<label for="btnPostCode">&nbsp;</label>
					<input type="button" class="form-control" id="btnPostCode" name="btnPostCode" value="우편번호찾기"
						onclick="sample2_execDaumPostcode()">
				</div>
			</div>

			<div class="row">
				<label for="phone_no">전화 번호</label>
				<input type="text" class="form-control" id="phone_no" name="phone_no">
			</div>
			
			<div class="row form-inline form-group">
				<!-- 	  	<div class="col-sm-10"> -->
				<label class="col-sm-4 control-label" for="email_chk">메일 수신 여부</label>
				<input type="checkbox" class="col-sm-2" id="email_chk" name="email_chk" value="Y">
			</div>
			<!-- 	  </div> -->

			<button type="submit" id="btn_join" class="w-100 btn btn-lg btn-primary">회원가입</button>


			<!-- 	    <div class="checkbox mb-3">
      <label>
        <input type="checkbox" value="remember-me"> Remember me
      </label>
    </div> -->

			<%@ include file="/WEB-INF/views/include/footer.jsp" %>
		</form>
	</main>
</div>
<script>
	
	$(document).ready(function(){

		let idCheck = false;
		let pwCheck = false;
		let emailConfirm = false;
		let emailCheck = false;

		// 아이디 중복 check
		$("#btn_userid_chk").on("click", function(){
			idCheck = false;
			let user_id = $("#user_id");
			let id_reg = RegExp(/^[a-z0-9]{5,15}$/);

			if(user_id.val() == "" || user_id.val() == null){
				alert("ID가 입력되지 않거나 잘못 입력되었습니다.");
				user_id.focus();
				return;
			}

			$.ajax({
				url: '/member/checkID',
				type: 'get',
				dataType: 'text',
				data: { user_id : user_id.val() },
				success: function(data){
					if(!id_reg.test($("#user_id").val())){
						alert("영어 대소문자, 숫자만 이용하여 아이디를 입력해 주세요.");
						$("#user_id").val("");
						user_id.focus();
						return;
					}else if(data == "Y"){
						idCheck = true;
						alert("사용 가능한 ID입니다.");
					}else if(data == "N"){
						user_id.val("");
						alert("사용 불가능한 ID입니다. 다시 입력해 주세요.");
					}
				}	
			});
			
		});
		
		// 비밀번호 일치 확인
		$("#btn_userpw_chk").on("click", function(){
			pwCheck = false;
			let userPw1 = $("#user_pw").val();
			let userPw2 = $("#user_pw2").val();
			let pw_reg = RegExp(/(?=.*[0-9a-zA-ZS])(?=.*?[#?!@$%^&*-]).{8,24}/);
			
			// 아이디와 비밀번호가 동일한지 확인
			if($("#user_id").val() == $("#user_pw").val()){
				alert("아이디와 비밀번호를 동일하게 입력할 수 없습니다.");
				$("#user_pw").val("");
				user_pw.focus();
				return;
			}
			
			// 비밀번호 유효성 검사
			if(!pw_reg.test($("#user_pw").val())){
				alert("영어 대소문자, 숫자를 이용하여 특수문자(#?!@$%^&*-)를 포함해서 비밀번호를 입력해 주세요.");
				user_pw.focus();
				return;
			}

			if (userPw1 != "" && userPw2 != ""){
				if(userPw1 == userPw2){
					alert("비밀번호가 일치합니다.")
					$("#userpwChk_state").html("일치합니다.");
					$("#userpwChk_state").css("color", "green");
					pwCheck = true;
				}else{
					alert("비밀번호가 일치하지 않습니다.")
					$("#userpwChk_state").html(" 다시 입력하세요.");
					$("#userpwChk_state").css("color", "red");
					user_pw.val("");
					user_pw2.val("");
					user_pw.focus();
				}
			}else if(userPw1 == "" && userPw2 != ""){
				alert("비밀번호가 입력되지 않았습니다.\n 비밀번호를 생성해 주세요.");
				user_pw.focus();
			}else if(userPw1 != "" && userPw2 == ""){
				alert("확인 비밀번호가 입력되지 않았습니다.\n비밀번호를 동일하게 입력해 주세요.");
				user_pw2.focus();
			}else{
				alert("비밀번호가 입력되지 않았습니다.\n비밀번호를 생성해 주세요.");
				user_pw.focus();
			}
			
		});

		// 이메일 인증 메일 보내기
		$("#btn_useremail_chk").on("click", function(){
			emailChkConfirm = false;
			let user_email = $("#user_email");

			if(user_email.val() == "" || user_email.val() == null){
				alert("이메일을 입력해 주세요.");
				user_email.focus();
				return false;
			}

			$.ajax({
				url: '/member/sendMailCode',
				type: 'get',
				dataType: 'text',
				data: {user_email : user_email.val()},
				success: function(data){
					if(data == "success"){
						emailChkConfirm = true;
						alert("인증 요청 메일이 발송되었습니다. 수신된 메일을 확인해 주세요.");
					}else if(data == "fail"){
						alert("이메일이 잘못되었습니다. 다시 확인해 주세요.");
						user_email.focus();
					}
				}
			});
		});

		// 메일 인증 확인
		$("#btn_usermail").on("click", function(){
			emailCheck = false;
			let user_email_code = $("#user_email_code");

			if(user_email_code.val() == "" || user_email_code.val() == null){
				alert("인증 코드를 입력해 주세요.");
				user_email_code.focus();
				return;
			}

			$.ajax({
				url: '/member/emailConfirm',
				type: 'get',
				dataType: 'text',
				data: { userEmailCode : user_email_code.val() },
				success: function(data){
					if(data == "success"){
						alert("인증이 완료되었습니다.");
						emailCheck = true;
					}else if(data == "fail"){
						alert("인증이 실패했습니다.\n 인증 코드를 다시 입력하시거나 인증 요청을 재시도 해 주세요.");
						user_email_code.val("");
					}
				}
			});
		});

		// 누락 정보 재확인
		$("#btn_join").click(function(){
			var user_id = $("#user_id").val();
			var user_pw = $("#user_pw").val();
			var user_pw2 = $("#user_pw2").val();
			var user_nm = $("#user_nm").val();
			var user_nick = $("#user_nick").val();
			var user_email = $("#user_email").val();
			var user_email_code = $("#user_email_code").val();

			if(user_id == "" || user_id == "N"){alert('아이디를 입력해 주세요.'); $('#user_id').focus(); return false;}
			if(user_pw == "" || user_pw == "N"){alert('비밀번호를 입력해 주세요.'); $('#user_pw').focus(); return false;}
			if(user_pw2 == "" || user_pw2 == "N"){alert('확인 비밀번호를 입력해 주세요.'); $('#user_pw2').focus(); return false;}
			if(user_nm == "" || user_nm == "N"){alert('이름을 입력해 주세요.'); $('#user_nm').focus(); return false;}
			if(user_nick == "" || user_nick == "N"){alert('닉네임을 입력해 주세요.'); $('#user_nick').focus(); return false;}
			if(user_email == "" || user_email == "N"){alert('이메일을 입력해 주세요.'); $('#user_email').focus(); return false;}
			if(user_email_code == "" || user_email_code == "N"){alert('이메일 인증 코드를 입력해 주세요.'); $('#user_email_code').focus(); return false;}

			return true;
			
			$('#joinForm').submit();
		});

		// join button 클릭 시, 유효성 검사 진행 여부
		function idPwChks(){
			if(idCheck = false){alert('아이디 중복 확인을 해 주세요.'); return false;}
			if(pwCheck = false){alert('비밀번호 확인 버튼을 클릭해 주세요.'); return false;}
			if(emailConfirm = false){alert('메일 인증 요청을 해 주세요.'); return false;}
			if(emailCheck = false){alert('메일 인증 확인을 해 주세요.'); return false;}

			return true;
		};
		
	});

</script>
		
<!--우편번호 DAUM API-->
<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
  <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
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
              oncomplete: function(data) {
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
                  if(data.userSelectedType === 'R'){
                      // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                      // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                      if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                          extraAddr += data.bname;
                      }
                      // 건물명이 있고, 공동주택일 경우 추가한다.
                      if(data.buildingName !== '' && data.apartment === 'Y'){
                          extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                      }
                      // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                      if(extraAddr !== ''){
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
              width : '100%',
              height : '100%',
              maxSuggestItems : 5
          }).embed(element_layer);
  
          // iframe을 넣은 element를 보이게 한다.
          element_layer.style.display = 'block';
  
          // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
          initLayerPosition();
      }
  
      // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
      // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
      // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
      function initLayerPosition(){
          var width = 300; //우편번호서비스가 들어갈 element의 width
          var height = 400; //우편번호서비스가 들어갈 element의 height
          var borderWidth = 5; //샘플에서 사용하는 border의 두께
  
          // 위에서 선언한 값들을 실제 element에 넣는다.
          element_layer.style.width = width + 'px';
          element_layer.style.height = height + 'px';
          element_layer.style.border = borderWidth + 'px solid';
          // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
          element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
          element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
      }
  </script>
		

	</body>

	</html>