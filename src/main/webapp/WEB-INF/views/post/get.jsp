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
  </style>

  <!-- Custom styles for this template -->
  <link href="/resources/css/cover.css" rel="stylesheet">
  <script src="//cdn.ckeditor.com/4.17.2/standard/ckeditor.js"></script>


</head>

<body class="d-flex h-100 text-center text-white bg-dark">

  <!-- main content -->
  <div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
    <%@ include file="/WEB-INF/views/include/header.jsp" %>

      <div class="row">
        <!-- read post -->
        <div class="col-md-12">
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">글 작성</h3>
            </div> <!-- /.box-header -->
          </div>
        </div>

        <div class="box-body">
          <div class="form-group">
            <label for="pst_no">게시글 번호</label>
            <input type="text" class="form-control" id="pst_no" name="pst_no" value="${post.pst_no }"
              readonly="readonly">
          </div>
          <div class="form-group">
            <label for="pst_title">제목</label>
            <input type="text" class="form-control" id="pst_title" name="pst_title" value="${post.pst_title }"
              readonly="readonly">
          </div>
          <div class="form-group">
            <label for="pst_content">내용</label>
            <%--<textarea class="form-control" rows="3" id="pst_content" name="pst_content" readonly="readonly">
              ${post.pst_content }</textarea> --%>
              <div>${ post.pst_content}</div>
          </div>
          <div class="form-group">
            <label for="pst_writer">작성자</label>
            <input type="text" class="form-control" id="pst_writer" name="pst_writer" value="${post.pst_writer }"
              readonly="readonly">
          </div>
        </div>
        <!-- /.box-body -->

        <div class="box-footer">
          <button id="btnModify" type="button" data-bno="${post.pst_no }" class="btn btn-primary">수정</button>
          <button id="btnList" type="button" class="btn btn-info">목록</button>


          <form id="operForm" action="/post/modify" method="get">
            <input type="hidden" id="bno" name="bno" value='<c:out value="${ post.pst_no}" />'>
            <input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }" />'>
            <input type="hidden" name="amount" value='<c:out value="${cri.amount }" />'>
            <input type="hidden" name="type" value='<c:out value="${cri.type }" />'>
            <input type="hidden" name="keyword" value='<c:out value="${cri.keyword }" />'>
          </form>

        </div><!-- read post -->

        <!--원본이미지 출력-->
        <div class='bigPictureWrapper'>
          <div class='bigPicture'>
          </div>
        </div>

        <style>
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
            align-content: center;
            text-align: center;
          }

          .uploadResult ul li img {
            width: 100px;
          }

          .uploadResult ul li span {
            color: white;
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
            background: rgba(255, 255, 255, 0.5);
          }

          .bigPicture {
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
          }

          .bigPicture img {
            width: 600px;
          }
        </style>

        <!-- 첨부파일목록 출력부분-->
        <div class="row">
          <div class="col-md-12">
            <div class="box box-primary">
              <div class="box-header with-border">
                <h3 class="box-title">Files</h3>
              </div>
              <div class="box-body">
                <div class="uploadResult">
                  <ul></ul>
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- ///////////////////////////////댓글//////////////////////////////// -->

        <!-- 댓글목록 출력부분 -->
        <div class="row">
          <div class="col-md-12">
            <button type="button" id="btnReplyAdd" class="btn btn-primary">Reply Write</button>
          </div>
        </div>

        <!--댓글 출력-->
        <div class="row">
          <div class="col-md-12">
            <div id="replyList">

            </div>
          </div>
        </div>

        <!--댓글 페이징 출력-->
        <div class="row" id="replyPaging">

        </div>

        <%@ include file="/WEB-INF/views/include/footer.jsp" %>
      </div><!-- main content -->


      <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
      <script id="replyTemplate" type="text/x-handlebars-template">
        {{#each .}}
        <div class="modal-body">
        <div class="form-group">
          <label for="cmt_writer" class="col-form-label rno"><b>No. <span class="reply-rno">{{rno}}</span></b></label>
          <input type="text" class="form-control" name="cmt_writer" readonly value="{{cmt_writer}}">
        </div>
        <div class="form-group">
          <label for="cmt_content" class="col-form-label regdate">{{prettifyDate cmt_date}}</label>
          <textarea class="form-control" name="cmt_content" readonly>{{cmt_content}}</textarea>
        </div>
        <div class="form-group">
          <button type="button" class="btn btn-link btn-reply-modify">Modify</button>
          <button type="button" class="btn btn-link btn-reply-delete">Delete</button>
        </div>
        </div>

        {{/each}}
        </script>

          <script>

            Handlebars.registerHelper("prettifyDate", function (timeValue) {
              const date = new Date(timeValue);

              return date.getFullYear() + "/" + date.getMonth() + 1 + "/" + date.getDate();

            });

            let printData = function (replyArr, target, templateObj) {

              let template = Handlebars.compile(templateObj.html());
              let html = template(replyArr);
              target.empty();
              target.append(html);

            }

            let printPaging = function (pageMaker, target) {

              let pageInfoStr = "<div class='col-md-12'><div class='dataTables_paginate paging_simple_numbers' id='example2_paginate'><ul class='pagination'>";

              if (pageMaker.prev) {
                pageInfoStr += "<li class='paginate_button previous ";
                pageInfoStr += "id='example2_previous'><a href='" + (pageMaker.startPage - 1) + "'";
                pageInfoStr += " aria-controls='example2' data-dt-idx='0' tabindex='0'>Previous</a></li>";
              }

              for (let i = pageMaker.startPage; i <= pageMaker.endPage; i++) {

                let strClass = (pageMaker.cri.pageNum == i) ? 'active' : '';
                pageInfoStr += "<li class='paginate_button " + strClass + "'><a href='" + i + "'>" + i + "</a></li>";
              }

              if (pageMaker.next) {
                pageInfoStr += "<li class='paginate_button next ";
                pageInfoStr += "id='example2_next'><a href='" + (pageMaker.endPage + 1) + "'";
                pageInfoStr += " aria-controls='example2' data-dt-idx='0' tabindex='0'>Next</a></li>";
              }

              pageInfoStr += "</ul></div></div>";

              target.html(pageInfoStr);
            }

            let pst_no = <c:out value="${ post.pst_no}" />;
            let replyPage = 1;

            let url = "/replies/pages/" + pst_no + "/" + replyPage + ".json";
            getPage(url);

            function getPage(url) {

              $.getJSON(url, function (data) {

                printData(data.list, $("#replyList"), $("#replyTemplate"));
                printPaging(data.pageMaker, $("#replyPaging"));

              });
            }

          </script>



          <script>
          
	          $(document).ready(function () {
	
	              let pst_no = '${ post.pst_no}';
	
	              $.getJSON("/post/getAttachList", { pst_no: pst_no }, function (arr) {
	
	                console.log(arr);
	
	                showUploadResult(arr);
	              });
	
	
	              function showUploadResult(uploadResultArr) {
	
	                if (!uploadResultArr || uploadResultArr.length == 0) { return; }
	
	                let uploadUL = $(".uploadResult ul");
	
	                let str = "";
	
	                $(uploadResultArr).each(function (i, obj) {
	
	                  if (obj.fileType) {
	
	                    let fileCalPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
	                    str += "<li data-path='" + obj.uploadPath + "'";
	                    str += " data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.fileType + "'>";
	                    str += "<div>";
	                    str += "<span>" + obj.fileName + "</span>";
	                    str += "<img src='/display?fileName=" + fileCalPath + "'>";
	                    str += "</div>";
	                    str += "</li>";
	
	                  } else {
	                  
	                    let fileCalPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
	                    let fileLink = fileCalPath.replace(new RegExp(/\\/g), "/");
	
	                    str += "<li data-path='" + obj.uploadPath + "'";
	                    str += " data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.fileType + "'>";
	                    str += "<div>";
	                    str += "<span>" + obj.fileName + "</span>";
	                    str += "<img src='/resources/img/attach.png'>";
	                    str += "</div>";
	                    str += "</li>";
	                  }
	                });
	                
	                console.log(str);
	
	                uploadUL.append(str);
	
	              }
	
	              $(".uploadResult").on("click", "li", function (e) {
	
	                console.log("veiw image");
	
	                let liObj = $(this);
	
	                let path = encodeURIComponent(liObj.data("path") + "/" + liObj.data("uuid") + "_" + liObj.data("filename"));
	
	                if (liObj.data("type")) {
	             
	                  showImage(path.replace(new RegExp(/\\/g), "/"));
	                } else {
	                 
	                  self.location = "/download?fileName=" + path;
	                }
	
	              });
	
	              function showImage(fileCalPath) {
	                alert(fileCalPath);
	
	                $(".bigPictureWrapper").css("display", "flex").show();
	                $(".bigPicture")
	                  .html("<img src='/display?fileName=" + fileCalPath + "'>")
	                  .animate({ width: '100%', height: '100%' }, 1000);
	
	              }
	
	              $(".bigPictureWrapper").on("click", function () {
	                $(".bigPicture").animate({ width: '0%', height: '0%' }, 1000);
	
	                setTimeout(function () {
	                  $(".bigPictureWrapper").hide();
	                }, 1000);
	              });
	              
	              // 몰곩
	              $("#btnList").on("click", function () {
	                operForm.find("#pst_no").remove();
	                operForm.attr("action", "/post/list");
	                operForm.submit();
	              });
	
	            });

            /*
            댓글 기능
            
            $(document).ready(function () {

              let operForm = $("#operForm");

              // 수정
              $("#btnModify").on("click", function () {
                operForm.submit();
              });

             

              //페이지 번호 클릭시.
              $("#replyPaging").on("click", "li.paginate_button a", function (e) {
                e.preventDefault();
                console.log("댓글 페이지번호 클릭");

                replyPage = $(this).attr("href");
                let url = "/replies/pages/" + bno + "/" + replyPage + ".json";
                getPage(url);
              });

              //댓글 쓰기
              $("#btnReplyAdd").on("click", function () {

                // 댓글 feild 초기화
                $("#cmt_writer").val("");
                $("#cmt_content").val("");

                $("button#btnReplyWrite").show();
                $("button#btnReplyModify").hide();


                $("h5#exampleModalLabel").html("Reply Add");
                $("#exampleModal").modal('show');
              });

              //댓글 저장
              $("#btnReplyWrite").on("click", function () {

                $("h5#exampleModalLabel").html("Reply Add");

                let cmt_writer = $("#cmt_writer").val();
                let cmt_content = $("#cmt_content").val();

                let str = JSON.stringify({pst_no: ${ post.pst_no }, cmt_writer: cmt_writer, cmt_content: cmt_content});

              console.log(str);

              $.ajax({
                type: 'post',
                url: '/replies/new',
                headers: {
                  "Content-Type": "application/json", "X-HTTP-Method-Override": "POST"
                },
                dataType: 'text',
                data: JSON.stringify({ pst_no: ${ post.pst_no }, cmt_writer: cmt_writer, cmt_content: cmt_content}),
                success: function(result) {
                  if (result == "success") {
                    alert("댓글 데이타 삽입성공");

                    // 댓글 field 초기화
                    $("#cmt_writer").val("");
                    $("#cmt_content").val("");


                    $("#exampleModal").modal('hide');

                    replyPage = 1;

                    url = "/replies/pages/" + pst_no + "/" + replyPage + ".json";
                    getPage(url);

                  }
                }
            });

        });

            $("#replyList").on("click", "button.btn-reply-modify", function () {

              let cmt_writer = $(this).parents("div.modal-body").find("input[name='cmt_writer']").val();
              let rno = $(this).parents("div.modal-body").find("span.reply-rno").text();
              let cmt_date = $(this).parents("div.modal-body").find("label.cmt_date").text();
              let cmt_content = $(this).parents("div.modal-body").find("textarea[name='cmt_content']").val();

              console.log("cmt_writer: " + cmt_writer);
              console.log("rno: " + rno);
              console.log("cmt_date: " + cmt_date);
              console.log("cmt_content: " + cmt_content);

              $("h5#exampleModalLabel").html("Reply Modify - ");
              $("h5#exampleModalLabel").append("&nbsp;&nbsp;No. " + rno);

              $("#cmt_writer").val(cmt_writer);
              $("#cmt_content").val(cmt_content);
              $("#replybno").val(rno);

              $("button#btnReplyWrite").hide();
              $("button#btnReplyModify").show();


              $("#exampleModal").modal('show');
            });

            //댓글 수정 btn 클릭시
            $("button#btnReplyModify").on("click", function () {

              $.ajax({
                type: 'put',
                url: '/replies/modify/' + $("#replybno").val(),
                headers: {
                  "Content-Type": "application/json", "X-HTTP-Method-Override": "PUT"
                },
                dataType: 'text',
                data: JSON.stringify({ cmt_content: $("#cmt_content").val() }),
                success: function (result) {
                  if (result == "success") {
                    alert("댓글 수정됨");

                    $("#cmt_writer").val("");
                    $("#cmt_content").val("");


                    $("#exampleModal").modal('hide');

                    url = "/replies/pages/" + pst_no + "/" + replyPage + ".json";
                    getPage(url);
                  }
                }
              });

            });

            //댓글 삭제 btn click
            $("#replyList").on("click", "button.btn-reply-delete", function () {

              let rno = $(this).parents("div.modal-body").find("span.reply-rno").text();

              if (!confirm("댓글 " + rno + "번을 삭제하겠습니까?")) { return; }

              $.ajax({
                type: 'delete',
                url: '/replies/delete/' + ${post.pst_no } + '/' + rno,
                headers: {
                "Content-Type": "application/json", "X-HTTP-Method-Override": "DELETE"
              },
                dataType: 'text',
                success: function (result) {
                  if (result == "success") {
                    alert("댓글삭제됨");

                    $("#exampleModal").modal('hide');

                    url = "/replies/pages/" + pst_no + "/" + replyPage + ".json";
                    getPage(url);

                  }
                }
        });
        });


        }); */


          </script>

          <!-- Modal Dialog-->
          <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">Reply Add</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  <form>
                    <div class="form-group">
                      <label for="cmt_writer" class="col-form-label">cmt_writer:</label>
                      <input type="text" class="form-control" id="cmt_writer" name="cmt_writer">
                      <input type="hidden" class="form-control" id="replybno" name="replyerbno">
                    </div>
                    <div class="form-group">
                      <label for="cmt_content" class="col-form-label">cmt_content:</label>
                      <textarea class="form-control" id="cmt_content" name="cmt_content"></textarea>
                    </div>
                  </form>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                  <button type="button" class="btn btn-primary" id="btnReplyWrite">write</button>
                  <button type="button" class="btn btn-primary" id="btnReplyModify">modify</button>
                </div>
              </div>
            </div>
          </div>
          <!-- Modal Dialog-->

</body>

</html>