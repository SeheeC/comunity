<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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

    .join-btn {
      color: #6c757d !important;
    }

    .box-header {
      margin-top: 50px;
    }

    .box-footer,
    .form-group {
      margin-top: 30px;
    }
    
    .uploadResult {
	  width: 100%;
	  background-color: gray;
	}
	
	.uploadResult ul {
	  display: flex;
	  flex-flow: row;
	  justify-content: center;
	  align-items: center;
	}
	
	.uploadResult ul li {
	  list-style: none;
	  padding: 10px;
	}
	
	.uploadResult ul li img {
	  width: 100px;
	}
	
	.bigPictureWrapper {
	  position: absolute;
	  display: none;
	  justify-content: center;
	  align-items: center;
	  top: 0%;
	  width: 100%;
	  height: 100%;
	  background-color: gray;
	  z-index: 100;
	}
	
	.bigPicture {
	  position: relative;
	  display: flex;
	  justify-content: center;
	  align-items: center;
	}
	
	.pst-table {
	  margin-top: 50px;
	  background-color: white;
	  color: black;
	}
	
	.list-container, .paging-container{
		margin-top: 50px !important;
	}
	
  </style>

  <!-- Custom styles for this template -->
  <link href="/resources/css/cover.css" rel="stylesheet">
  <script src="//cdn.ckeditor.com/4.17.2/standard/ckeditor.js"></script>


</head>

<body class="d-flex h-100 text-center text-white bg-dark">

  <!-- content -->
  <div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
    <%@ include file="/WEB-INF/views/include/header.jsp" %>

      <div class="row list-container">
        <table class="pst-table">
          <thead>
            <tr>
              <th>게시물 번호</th>
              <th>제목</th>
              <th>작성자</th>
              <th>작성일</th>
              <th>조회 수</th>
              <th>댓글 수</th>
              <th>좋아요 수</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach items="${list}" var="post" varStatus="status">
              <tr role="row" class="<c:if test=" ${status.count % 2==0}">odd</c:if>
                <c:if test="${status.count % 2 != 0}">even</c:if>">
                <td class="sorting_1">
                  <c:out value="${post.pst_no }"></c:out>
                </td>
                <td>
                  <a class="move" href="<c:out value=" ${post.pst_no }"></c:out>">
                    <c:out value="${post.pst_title }"></c:out>
                  </a>
                </td>
                <td>
                  <c:out value="${post.pst_writer }"></c:out>
                </td>
                <td>
                  <fmt:formatDate value="${post.pst_wr_date }" pattern="yyyy-MM-dd" />
                </td>
                <td>
                  <c:out value="${post.pst_hit }"></c:out>
                </td>
                <td>
                  <c:out value="${post.pst_cmt_cnt }"></c:out>
                </td>
                <td>
                  <c:out value="${post.pst_itr }"></c:out>
                </td>
              </tr>
            </c:forEach>
          </tbody>

        </table>

        <!-- list nav bar
        <div class="row">
          <div class="col-sm-6">
            <div class="dataTables_paginate paging_simple_numbers" id="example2_paginate">
              <ul class="pagination">
                <li class="paginate_button previous disabled" id="example2_previous"><a href="#"
                    aria-controls="example2" data-dt-idx="0" tabindex="0">Previous</a></li>
                <li class="paginate_button active"><a href="#" aria-controls="example2" data-dt-idx="1"
                    tabindex="0">1</a></li>
                <li class="paginate_button "><a href="#" aria-controls="example2" data-dt-idx="2"
                    tabindex="0">2</a></li>
                <li class="paginate_button "><a href="#" aria-controls="example2" data-dt-idx="3"
                    tabindex="0">3</a></li>
                <li class="paginate_button "><a href="#" aria-controls="example2" data-dt-idx="4"
                    tabindex="0">4</a></li>
                <li class="paginate_button "><a href="#" aria-controls="example2" data-dt-idx="5"
                    tabindex="0">5</a></li>
                <li class="paginate_button "><a href="#" aria-controls="example2" data-dt-idx="6"
                    tabindex="0">6</a></li>
                <li class="paginate_button next" id="example2_next"><a href="#" aria-controls="example2"
                    data-dt-idx="7" tabindex="0">Next</a></li>
              </ul>
            </div>
          </div>
        </div> -->
        
        <div class="container paging-container"><!-- paging row -->
			<div class="row">
				<div class="dataTables_info col-sm-8">
					<form id="searchForm" action="/post/list" method="get">
						<select name="type">
							<option value=""
								<c:out value="${pageMaker.cri.type == null? 'selected':'' }" />>--</option>
							<option value="T"
								<c:out value="${pageMaker.cri.type eq 'T'? 'selected':'' }" />>제목</option>
							<option value="C"
								<c:out value="${pageMaker.cri.type eq 'C'? 'selected':'' }" />>내용</option>
							<option value="W"
								<c:out value="${pageMaker.cri.type eq 'W'? 'selected':'' }" />>작성자</option>
							<option value="TC"
								<c:out value="${pageMaker.cri.type eq 'TC'? 'selected':'' }" />>제목+내용</option>
							<option value="TW"
								<c:out value="${pageMaker.cri.type eq 'TW'? 'selected':'' }" />>제목+작성자</option>
							<option value="TWC"
								<c:out value="${pageMaker.cri.type eq 'TWC'? 'selected':'' }" />>전체</option>
						</select>
							<input type="text" name="keyword" value="<c:out value="${ pageMaker.cri.keyword}" />">
							<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
							<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
							<button class="btn btn-primary">Search</button>
					</form>
					<!--
					<div class="dataTables_info" id="example2_info" role="status"
						aria-live="polite">Showing 1 to 10 of 57 entries</div>
						-->
				</div>
				<div class="col-sm-4">
					<div class="dataTables_paginate paging_simple_numbers" id="example2_paginate">
						<ul class="pagination">
						<c:if test="${pageMaker.prev }">
							<li class='paginate_button previous ${pageMaker.prev ? "": "disabled" }'
								id="example2_previous"><a href="${pageMaker.startPage - 1}"
								aria-controls="example2" data-dt-idx="0" tabindex="0">Previous</a></li>
						</c:if>
						<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">	
							<li class='paginate_button ${pageMaker.cri.pageNum == num ? "active":"" }'><a href="${num}"
								aria-controls="example2" data-dt-idx="1" tabindex="0">${num}</a></li>
						</c:forEach>
						<c:if test="${pageMaker.next }">	
							<li class="paginate_button next" id="example2_next"><a
								href="${pageMaker.endPage + 1}" aria-controls="example2" data-dt-idx="7"
								tabindex="0">Next</a></li>
						</c:if>
						</ul>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-sm-8">
					<form id="actionForm" action="/post/list" method="get">
						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
						<input type="hidden" name="type" value="${pageMaker.cri.type}">
						<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
					</form>
				</div>
				<div class="col-sm-4">
					<a href="/post/write" class="btn btn-lg btn-secondary fw-bold border-white bg-white join-btn">글 쓰기</a>
				</div>
			</div>


		</div><!-- paging-container -->

        <%@ include file="/WEB-INF/views/include/footer.jsp" %>
      </div><!-- row -->
  </div><!-- cover-container -->

  <script>
   	$(document).ready(function() {

		let actionForm = $("#actionForm");
		
		// 리스트에서 제목 클릭시 동작
		$(".move").on("click", function(e) {

			e.preventDefault();

			let pst_no = $(this).attr("href");
			console.log("글번호" + pst_no);

			actionForm.append("<input type='hidden' name='pst_no' value='" + $(this).attr("href") + "'>");
			actionForm.attr("action", "/post/get");

			actionForm.submit();

		});

		$(".paginate_button a").on("click", function(e){
			e.preventDefault();

			actionForm.find("input[name='pageNum']").val($(this).attr("href"));

			console.log("click");

			actionForm.submit();
		});
		
    }); // paging end
  </script>

</body>

</html>