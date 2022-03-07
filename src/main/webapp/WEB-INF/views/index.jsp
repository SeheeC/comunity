<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en" class="h-100">
  <head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/cover/">
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    
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
      
      .join-btn{
      	color: #6c757d!important;
      }
    </style>
    
    <!-- Custom styles for this template -->
	<link href="/resources/css/cover.css" rel="stylesheet">
    <script>
  	
  	let msg = '${msg}'; // EL구문.  'modifyOk'
  	if(msg == 'modifyOk'){
  		alert("회원정보가 수정되었습니다.");
  	}
  
  </script>

    
  </head>
  <body class="d-flex h-100 text-center text-white bg-dark">
  
<div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
  <%@ include file="/WEB-INF/views/include/header.jsp" %>

  <main class="px-3 mt-auto">
    <h1>Jogak comunity</h1>
    <p class="lead">‘커뮤니티 조각’은 모두가 쉽게 대화할 수 있는 공간입니다.</p>
    <p class="lead">
    	<c:if test="${sessionScope.loginStatus == null }">
      		<a href="/member/join" class="btn btn-lg btn-secondary fw-bold border-white bg-white join-btn">가입하기</a>
      	</c:if>
    </p>
  </main>
  
  <footer class="mt-auto text-white-50">
    <p>Cover template for <a href="https://getbootstrap.com/" class="text-white">Bootstrap</a>, by <a href="https://twitter.com/mdo" class="text-white">@mdo</a>.</p>
  </footer>
</div>


    
  </body>
</html>