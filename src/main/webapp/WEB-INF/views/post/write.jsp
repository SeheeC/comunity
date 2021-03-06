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
              <h3 class="box-title">??? ??????</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form" action="/post/write" method="post">
              <div class="box-body">
                <div class="form-group">
                  <label for="pst_title">??? ??????</label>
                  <input type="text" class="form-control" id="pst_title" name="pst_title">
                </div>
                <div class="row">
	                <div class="col-md-6">
	                  <label for="pst_writer">?????????</label>
	                  <input type="text" class="form-control" id="pst_writer" name="pst_writer"
	                    value="<c:out value='${userStatus.user_nick}' />" readonly>
	                </div>    
                  	<div class="col-md-6">
	                  <label for="pst_writer">?????????</label>
	                  <input type="text" class="form-control" id="user_id" name="user_id"
	                    value="<c:out value='${userStatus.user_id}' />" readonly>
	               	</div>
                </div>
                
                <div class="form-group">
                  <label for="pst_content">??????</label>
                  <textarea class="form-control" rows="3" id="pst_content" name="pst_content"></textarea>
                  <script>
                    CKEDITOR.replace('pst_content', { height: 500 });
                  </script>
                </div>
              </div>
              <!-- /.box-body -->

              <!-- ?????????????????? ???????????? ????????????-->
              <div class="row">
                <div class="col-md-12">
                  <div class="box box-primary">
                    <div class="box-header with-border">
                      <h3 class="box-title">?????? ??????</h3>
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
                <button type="submit" class="btn btn-primary" id="btn_post">??????</button>
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

      CKEDITOR.replace('pst_content', ckeditor_config);

    });
  </script>
  <script>

  $(document).ready(function(){
	// ????????? ????????? ????????? change???????????? ??????
    $("input[type='file']").change(function(e){

      // <input type="file" name="uploadFile" multiple>

      let formData = new FormData(); // <form>?????? ????????? ???????????? ??????
      let inputFile = $("input[name='uploadFile']"); // ?????????(??????)

      let files = inputFile[0].files;

      for(let i=0; i<files.length; i++){

        if(!checkExtension(files[i].name, files[i].size)){
          return false;
        }

        formData.append("uploadFile", files[i]);
      }

      $.ajax({
        url: "/uploadAjaxAction", // ??????????????? ????????????
        processData: false,
        contentType: false,
        data:formData,
        type:'POST',
        dataType:"json",
        success: function(result){ // result: ???????????? ????????????????????? List??????????????? ????????????????????? ?????????.
          console.log(result);  // AttachFileDTO ?????????

          	// ????????? ??????????????? ??????
      		showUploadResult(result);
        }
      });


    });


    let regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
    let maxSize = 5 * 1024 * 1024;

    function checkExtension(fileName, fileSize){

      if(fileSize >= maxSize){
        alert("?????? ????????????");
        return false;
      }

      if(regex.test(fileName)){
        alert("?????? ????????? ????????? ????????? ??? ??? ????????????.");
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

      console.log(str);

      uploadUL.append(str);

    }



    let formObj = $("form[role='form']");

    $("button[type='submit']").on("click", function(e){
      e.preventDefault();

      console.log("submit click");

      let str = "";

      $(".uploadResult ul li").each(function(i, obj){
        let jobj = $(obj);

        console.dir(jobj);
        console.log("------------------");
        console.log(jobj.data("filename"));

        str += "<input type='hidden' name='attachList[" + i + "].fileName' value='" + jobj.data("filename") + "'>";
        str += "<input type='hidden' name='attachList[" + i + "].uuid' value='" + jobj.data("uuid") + "'>";
        str += "<input type='hidden' name='attachList[" + i + "].uploadPath' value='" + jobj.data("path") + "'>";
        str += "<input type='hidden' name='attachList[" + i + "].fileType' value='" + jobj.data("type") + "'>";
      });

      console.log(str);

      formObj.append(str);
      formObj.submit();

    });

    $(".uploadResult").on("click", "button", function(){

      console.log("delete file");

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