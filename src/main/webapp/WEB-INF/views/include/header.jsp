<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/plugin_js.jsp" %>
<!-- Custom styles for this template -->

<style>

/*
 * Header
 */

.nav-masthead .nav-link {
  padding: .25rem 0;
  font-weight: 700;
  color: rgba(255, 255, 255, .5);
  background-color: transparent;
  border-bottom: .25rem solid transparent;
}

.nav-masthead .nav-link:hover,
.nav-masthead .nav-link:focus {
  border-bottom-color: rgba(255, 255, 255, .25);
}

.nav-masthead .nav-link + .nav-link {
  margin-left: 1rem;
}

.nav-masthead .active {
  color: #fff;
  border-bottom-color: #fff;
}

.nav-backgroundcolor{
	background-color: rgb(33, 37, 41);
	color: white;
}

</style>
<div class="cover-container d-flex w-100 h-30 p-3 mx-auto flex-column nav-backgroundcolor">
	<header class="mb-auto">
		<div>
			<h3 class="float-md-start mb-0">조각 커뮤니티</h3>
			<nav class="nav nav-masthead justify-content-center float-md-end">
			
				<!-- 로그인 이전 상태 표시 -->
				<c:if test="${sessionScope.loginStatus == null }">
					<a class="nav-link active" aria-current="page" href="/">홈</a>
					<a class="nav-link" href="#">게시판</a>
					<a class="nav-link" href="/member/login">로그인</a>
				</c:if>
				
				<!-- 로그인 이후 상태 표시 -->
				<c:if test="${sessionScope.loginStatus != null }">
					<a class="nav-link active" aria-current="page" href="/">홈</a>
					<a class="nav-link" href="/post/list">게시판</a>
					<a class="nav-link" href="/member/mypage">나의 정보</a>
	       			<a class="nav-link" href="/member/logout">로그아웃</a>
				</c:if>
			</nav>
		</div>
	</header>
</div>