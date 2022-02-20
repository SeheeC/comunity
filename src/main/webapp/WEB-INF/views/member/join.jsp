<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>회원 가입</title>

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
      
      .row {
      	padding-top: 50px;
      }
      
      .control-label{
      	padding: 0;
      }
      
      #btn_join{
      	margin-top: 50px;
      }
    </style>

    
    <!-- Custom styles for this template -->
    <link href="/resources/css/signin.css" rel="stylesheet">
  </head>
  <body class="text-center">
    
<main class="form-signin">
  <form action="/member/join" method="post" id="joinForm">
		<!-- <img class="mb-4" src="../assets/brand/bootstrap-logo.svg" alt="" width="72" height="57"> -->
	    <h1 class="h3 mb-3 fw-normal">회원 가입</h1>
	
  	<div class="row">
	    <div class="col-md-8">
	      <input type="text" class="form-control" id="user_id" name="user_id" placeholder="아이디를 생성하세요.">
	    </div>
	    <div class="col-md-4">
		    <button type="button" class="form-control" id="user_id_chk">아이디 중복 확인</button>
	    </div>
    </div>
	    <div class="row">
	      	<input type="password" class="form-control" id="user_pw" name="user_pw">
	    </div>
	    <div class="row">
	    <input type="text" class="form-control" id="user_pw_chk" placeholder="비밀번호 확인">
	  </div>
	    <div class="form-group row">
	      <input type="text" class="form-control" id="user_nm" name="user_nm" placeholder="이름">
	    </div>
	    <div class="form-group row">
	      <input type="text" class="form-control" id="user_nick" name="user_nick" placeholder="닉네임">
	    </div>
    <div class="row">
	    <div class="col-md-6">
		    <label for="user_email">이메일</label>
		    <input type="text" class="form-control" id="user_email" name="user_email">
		</div>
		<div class="col-md-2">
			<label for="user_email_chk">메일을 확인해 주세요.</label>
		    <button type="button" class="form-control" id="user_email_chk">메일 인증 요청</button>
	    </div>
	    <div class="col-md-2">
		    <label for="user_email_code">메일 인증 코드 입력</label>
		    <input type="text" class="form-control" id="user_email_code" name="user_email_code">
		</div>
		<div class="col-md-2">
			<label id=user_email_chkstate>&nbsp;</label>
		    <button type="button" class="form-control" id="btn_user_mail">메일 인증 확인</button>
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
	      <input type="button" class="form-control" id="btnPostCode" name="btnPostCode"  value="우편번호찾기" onclick="sample2_execDaumPostcode()">
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

    
  </form>
  
</main>
    
  </body>
</html>
