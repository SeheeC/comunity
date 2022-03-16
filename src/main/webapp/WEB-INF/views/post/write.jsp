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
  </style>

  <!-- Custom styles for this template -->
  <link href="/resources/css/cover.css" rel="stylesheet">
  <script src="//cdn.ckeditor.com/4.17.2/standard/ckeditor.js"></script>


</head>

<body class="d-flex h-100 text-center text-white bg-dark">

  <!-- content -->
  <div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
    <%@ include file="/WEB-INF/views/include/header.jsp" %>

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
        }

        .uploadResult ul li img {
          width: 100px;
        }
      </style>

      <style>
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

      <div class="row">
        <div class="col-md-12">
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">글 작성</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form" action="/post/write" method="post">
              <div class="box-body">
                <div class="form-group">
                  <label for="pst_title">글 제목</label>
                  <input type="text" class="form-control" id="pst_title" name="pst_title">
                </div>
                <div class="form-group">
                  <label for="pst_writer">작성자</label>
                  <input type="text" class="form-control" id="pst_writer" name="pst_writer"
                    value='<c:out value="${MemberVO.user_nm}" />' readonly>
                </div>
                <div class="form-group">
                  <label for="pst_content">내용</label>
                  <textarea class="form-control" rows="3" id="pst_content" name="pst_content"></textarea>
                  <script>
                    CKEDITOR.replace('pst_content', { height: 500 });
                  </script>
                </div>
              </div>
              <!-- /.box-body -->

              <!-- 파일업로드및 파일목록 출력위치-->
              <div class="row">
                <div class="col-md-12">
                  <div class="box box-primary">
                    <div class="box-header with-border">
                      <h3 class="box-title">파일 첨부</h3>
                    </div>
                    <div class="box-body">
                      <div class="form-group uploadDiv">
                        <input type="file" name="uploadFile" multiple>
                      </div>
                      <div class="uploadResult">
                        <ul></ul>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="box-footer">
                <button type="submit" class="btn btn-primary" id="btn_post">저장</button>
              </div>
            </form>
          </div>
        </div>
      </div>

      <%@ include file="/WEB-INF/views/include/footer.jsp" %>
  </div><!-- content -->
  <script>
    //CKEditor
    $(document).ready(function(){

      let ckeditor_config = {

        resize_enabled : false,
        enterMode : CKEDITOR.ENTER_BR,
        shiftEnterMode : CKEDITOR.ENTER_P,
        toolbarCanCollapse: true,
        removePlugins : "elementspath",

        filebrowserUploadUrl : "/editor/imageUpload"

      };

      CKEDITOR.replace('content', ckeditor_config);

    });
  </script>
  <!-- <script>

    $(document).ready(function(){
      $("input[type='file']").change(function(e){

        let formData = new FormData;
        let inputFile = $("input[name='uploadFile']");

        let files = inputFile[0].files;

        for(let i=0; i<files.length; i++){

          if(!checkExtension(files[i].name, files[i].size)){
        	  return false;
          }
          
          formData.append("uploadFile", files[i]);

        }

      });
    }); -->

  </script>

</body>

</html>