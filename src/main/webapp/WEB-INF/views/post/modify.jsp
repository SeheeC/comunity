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

  <!-- content -->
  <div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
    <%@ include file="/WEB-INF/views/include/header.jsp" %>

      <div class="row">
        <div class="col-md-12">
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">글 작성</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form" action="/post/modify" method="post" id="modifyForm">
            	<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }" />'>
	              <input type="hidden" name="amount" value='<c:out value="${cri.amount }" />'>
	              <input type="hidden" name="type" value='<c:out value="${cri.type }" />'>
	              <input type="hidden" name="keyword" value='<c:out value="${cri.keyword }" />'>
	              
	              <div class="box-body">
	              	<div class="form-group">
	                  <label for="pst_no">글 번호</label>
	                  <input type="text" class="form-control" id="pst_no" name="pst_no" value="${post.pst_no }" readonly>
	                </div>
	                <div class="form-group">
	                  <label for="pst_title">글 제목</label>
	                  <input type="text" class="form-control" id="pst_title" name="pst_title" value="${post.pst_title }">
	                </div>
	                <div class="row">
		                <div class="col-md-6">
		                  <label for="pst_writer">작성자</label>
		                  <input type="text" class="form-control" id="pst_writer" name="pst_writer"
		                    value="<c:out value='${userStatus.user_nick}' />" readonly>
		                </div>    
	                  	<div class="col-md-6">
		                  <label for="pst_writer">아이디</label>
		                  <input type="text" class="form-control" id="user_id" name="user_id"
		                    value="<c:out value='${userStatus.user_id}' />" readonly>
		               	</div>
	                </div>
                
                <div class="form-group">
                  <label for="pst_content">내용</label>
                  <textarea class="form-control" rows="3" id="pst_content" name="pst_content">value="${post.pst_content }"</textarea>
                  <script>
                    CKEDITOR.replace('pst_content', { height: 500 });
                  </script>
                </div>
                
                <div class="form-group">
                  <label for="pst_wr_date">RegDate</label> <!-- pattern="yyyy-MM-dd"  날짜포맷이 에러가 발생된다.-->
                  <input type="text" class="form-control" id="pst_wr_date" name="pst_wr_date" value="<fmt:formatDate value="${post.pst_wr_date }" pattern="yyyy/MM/dd"/>" readonly="readonly">
                </div>
                <div class="form-group">
                  <label for="pst_update_date">Update Date</label>
                  <input type="text" class="form-control" id="pst_update_date" name="pst_update_date" value="<fmt:formatDate value="${post.pst_update_date }" pattern="yyyy/MM/dd"/>" readonly="readonly">
                </div>
              </div>
              <!-- /.box-body -->

              <div class="box-footer">
                <button id="btnModify" type="submit" class="btn btn-primary">Modify</button>
                <button id="btnRemove" type="button" class="btn btn-danger">Remove</button>
                <button id="btnList" type="button" class="btn btn-info">List</button>
              </div>
            </form>
          </div>
        </div>
      </div>
      
      <!-- 파일업로드및 파일목록 출력위치-->
	<div class="row">
		<div class="col-md-12">
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">File Attach</h3>
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

      <%@ include file="/WEB-INF/views/include/footer.jsp" %>
  </div><!-- content -->
  <script>
    // CKEditor 작업구문.
	$(document).ready(function(){
		
		let ckeditor_config = {
			resize_enabled : false,
			enterMode : CKEDITOR.ENTER_BR,
			shiftEnterMode : CKEDITOR.ENTER_P,
			toolbarCanCollapse : true,
			removePlugins : "elementspath",
			
			filebrowserUploadUrl : "/editor/imageUpload"  // /editor/imageUpload. 이미지 업로드시 업로드탭 보기
				
		};
		
		CKEDITOR.replace('content', ckeditor_config);
		
		// 4.8.0 (Standard)
		// alert(CKEDITOR.version);  
		
	});
</script>

<script>

  $(document).ready(function(){

    let formObj = $("#modifyForm");

    $("#btnList").on("click", function(){

      formObj.attr("action", "/post/list");
      formObj.attr("method", "get");

      let pageNumTag = $("input[name='pageNum']").clone();
      let amountTag = $("input[name='amount']").clone();
      let keywordTag = $("input[name='type']").clone();
      let typeTag = $("input[name='keyword']").clone();

      formObj.empty(); // 폼 모든 내용 제거.

      formObj.append(pageNumTag);
      formObj.append(amountTag);
      formObj.append(keywordTag);
      formObj.append(typeTag);


      formObj.submit();
      
    });

    $("#btnRemove").on("click", function(){

      if(confirm("게시물을 삭제하겠습니까?")){
        formObj.attr("action", "/post/remove");
        formObj.submit();
      }
      
    });

  });

</script>

<script>

  $(document).ready(function(){
	
	let bno = '${ post.pst_no}'; 
	
	$.getJSON("/post/getAttachList", {pst_no: pst_no}, function(arr){
	    
	let uploadUL = $(".uploadResult ul");

    let str = "";

    $(arr).each(function(i, obj) {

      if(obj.fileType){
        // image file
        let fileCalPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
        str += "<li data-path='" + obj.uploadPath + "'";
        str += " data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName +"' data-type='" + obj.fileType + "'>";
        str += "<div>";
        str += "<span>" + obj.fileName + "</span>";
        str += "<button type='button' data-file='" + fileCalPath + "' ";
        str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
        str += "<img src='/display?fileName=" + fileCalPath + "'>";
        str += "</div>";
        str += "</li>";
      }else{
        // 일반 file
        let fileCalPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
        let fileLink = fileCalPath.replace(new RegExp(/\\/g), "/");
        
        str += "<li data-path='" + obj.uploadPath + "'";
        str += " data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName +"' data-type='" + obj.fileType + "'>";
        str += "<div>";
        str += "<span>" + obj.fileName + "</span>";
        str += "<button type='button' data-file='" + fileCalPath + "' ";
        str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
        str += "<img src='/resources/img/attach.png'>";
        str += "</div>";
        str += "</li>";
      }
    });

    uploadUL.append(str);  
  });
	  
	  
	// 업로드 file 선택 시 change event 발생
    $("input[type='file']").change(function(e){

      let formData = new FormData();
      let inputFile = $("input[name='uploadFile']");

      let files = inputFile[0].files;

      for(let i=0; i<files.length; i++){

        if(!checkExtension(files[i].name, files[i].size)){
          return false;
        }

        formData.append("uploadFile", files[i]);
        
      }

      $.ajax({
        url: "/uploadAjaxAction",
        processData: false,
        contentType: false,
        data:formData,
        type:'POST',
        dataType:"json",
        success: function(result){
      		showUploadResult(result);
        }
      });

    });


    let regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
    let maxSize = 5 * 1024 * 1024;

    function checkExtension(fileName, fileSize){

      if(fileSize >= maxSize){
        alert("파일 크기초과");
        return false;
      }

      if(regex.test(fileName)){
        alert("해당 종류의 파일은 업로드 할 수 없습니다.");
        return false;
      }

      return true;
    }

    function showUploadResult(uploadResultArr){

      if(!uploadResultArr || uploadResultArr.length == 0){return;}

      let uploadUL = $(".uploadResult ul");

      let str = "";

      $(uploadResultArr).each(function(i, obj) {

        if(obj.image){
        	
          let fileCalPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
          str += "<li data-path='" + obj.uploadPath + "'";
          str += " data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName +"' data-type='" + obj.image + "'>";
          str += "<div>";
          str += "<span>" + obj.fileName + "</span>";
          str += "<button type='button' data-file='" + fileCalPath + "' ";
          str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
          str += "<img src='/display?fileName=" + fileCalPath + "'>";
          str += "</div>";
          str += "</li>";
          
        }else{
        	
          // 일반 file
          let fileCalPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
          let fileLink = fileCalPath.replace(new RegExp(/\\/g), "/");
          
          str += "<li data-path='" + obj.uploadPath + "'";
          str += " data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName +"' data-type='" + obj.image + "'>";
          str += "<div>";
          str += "<span>" + obj.fileName + "</span>";
          str += "<button type='button' data-file='" + fileCalPath + "' ";
          str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
          str += "<img src='/resources/img/attach.png'>";
          str += "</div>";
          str += "</li>";
          
        }
      });

      uploadUL.append(str);

    }

    let formObj = $("form[role='form']");

    // 수정 동작
    $("#btnModify").on("click", function(e){
      e.preventDefault(); // 전송기능 취소

      let str = "";

      $(".uploadResult ul li").each(function(i, obj){
        let jobj = $(obj);

        str += "<input type='hidden' name='attachList[" + i + "].fileName' value='" + jobj.data("filename") + "'>";
        str += "<input type='hidden' name='attachList[" + i + "].uuid' value='" + jobj.data("uuid") + "'>";
        str += "<input type='hidden' name='attachList[" + i + "].uploadPath' value='" + jobj.data("path") + "'>";
        str += "<input type='hidden' name='attachList[" + i + "].fileType' value='" + jobj.data("type") + "'>";
      });

      formObj.append(str);
      formObj.submit();

    });

    $(".uploadResult").on("click", "button", function(){

      let targetFile = $(this).data("file");
      let type = $(this).data("type");

      let targetli = $(this).closest("li");

      $.ajax({
        url: '/deletedFile',
        data: {fileName: targetFile, type:type},
        dataType: 'text',
        type: 'POST',
        success: function(result){
          alert(result);

          targetli.remove();
        }
      });
    });
  });

</script>

</body>

</html>