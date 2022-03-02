<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    </style>


    <!-- Custom styles for this template -->
    <link href="/resources/css/signin.css" rel="stylesheet">
  </head>

  <body class="text-center">
  <%@include file="/WEB-INF/views/include/header.jsp" %>
    <main class="form-signin">
      <form>
        <!--     <img class="mb-4" src="../assets/brand/bootstrap-logo.svg" alt="" width="72" height="57"> -->
        <h1 class="h3 mb-3 fw-normal">어서오세요! <br> 로그인하시겠어요?</h1>

        <div class="form-floating">
          <input type="text" class="form-control" id="user_id" name="user_id" placeholder="ID">
          <label for="user_id">ID</label>
        </div>
        <div class="form-floating">
          <input type="password" class="form-control" id="user_pw" name="user_pw" placeholder="Password">
          <label for="user_pw">Password</label>
        </div>


        <div class="form-floating">
          <a href="#" class="btn_SearchPw">아이디/비밀번호 찾기</a>
          <a href="/member/join" class="btn_join">회원가입</a>
        </div>
        <button class="w-100 btn btn-lg btn-primary" type="submit" id="btn_login">Login</button>
        <p class="mt-5 mb-3 text-muted">&copy; 2017–2021</p>
      </form>
    </main>

    <script>

      $(document).ready(function(){

        // 로그인
        $("#btn_login").on("click", function(){

          let user_id = $("#user_id");
          let user_pw = $("#user_pw");

          if(user_id.val() == "" || user_id.val() == null){
            alert("아이디를 입력해 주세요.");
            user_id.focus();
            return;
          }

          if(user_pw.val() == "" || user_pw.val() == null){
            alert("비밀번호를 입력해 주세요.");
            user_pw.focus();
            return;
          }

          $.ajax({
            url: '/member/login',
            type: 'post',
            dataType: 'text',
            data: { user_id : user_id.val(), user_pw : user_pw.val() },
            success: function(data){
              if(data == "success"){
            	alert("로그인 되었습니다.")
                location.href = "/member/index";
              }else if(data == "idFail"){
                alert("아이디를 확인해 주세요.");
                user_id.focus();
              }else if(data == "pwFail"){
                alert("비밀번호를 확인해 주세요.");
                user_pw.focus();
              }
            }
          });
        });

      });
    </script>
  </body>

  </html>