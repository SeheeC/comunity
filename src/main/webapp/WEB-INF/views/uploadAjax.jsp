<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	  top:0%;
	  width:100%;
	  height:100%;
	  background-color: gray; 
	  z-index: 100;
	}
	
	.bigPicture {
	  position: relative;
	  display:flex;
	  justify-content: center;
	  align-items: center;
	}
</style>
</head>
<body>
<h1>Upload with Ajax</h1>
<div class="bigPictureWrapper">
	<div class="bigPicture"></div>
</div>

<div class="uploadDiv">
	<input type="file" name="uploadFile" multiple>
</div>

<!-- 업로드된 파일정보를 사용하여, 업로드 파일목록출력-->
<div class="uploadResult">
	<ul></ul>
</div>

<button id="uploadBtn">Upload</button>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

	let regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	let maxSize = 5 * 1024 * 1024; //5mb
	
	function checkExtension(fileName, fileSize){

		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}

		if(regex.test(fileName)){
			alert("해당 종류의 파일은 업로드 불가.");
			return false;
		}

		return true;

	}

	let cloneObj = $(".uploadDiv").clone();

	let uploadResult = $(".uploadResult ul");

	function showUploadedFile(uploadResultArr){
		let str = "";

		$(uploadResultArr).each(function(i, obj){
			
			if(!obj.image){

				let fileCalPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);

				str += "<li><div><a href='/download?fileName="+ fileCalPath + "'><img src='/resources/img/attach.png'>" + obj.fileName + "</a>" +
					"<span style='cursor:pointer;' data-file=\'" + fileCalPath + "\' data-type='file'> x </span></div></li>";
			}else{

				let fileCalPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
				let originPath = obj.uploadPath + "\\" + obj.uuid + "_" + obj.fileName;

				originPath = originPath.replace(new RegExp(/\\/g), "/");

				console.log(fileCalPath);
				
				str += "<li><a href=\"javascript:showImage('" + originPath + "')\"><img src='/display?fileName=" + fileCalPath + "'></a>" + 
					"<span style='cursor:pointer;' data-file=\'" + fileCalPath + "\' data-type='image'> x </span></li>";
			}
			
		});

		uploadResult.append(str);

	}

	function showImage(fileCalPath){

		$(".bigPictureWrapper").css("display", "flex").show();

		$(".bigPicture")
			.html("<img src='/display?fileName="+fileCalPath+"'>")
			.animate({width:'100%', height:'100%'}, 1000);

	}

	$(document).ready(function(){

		$("#uploadBtn").on("click", function(){

			let formData = new FormData();

			let inputFile = $("input[name='uploadFile']");

			let files = inputFile[0].files;

			for(let i=0; i<files.length; i++){
				
				if(!checkExtension(files[i].name, files[i].size)) {
					return false;
				}
												
				formData.append("uploadFile", files[i]);
			}

			$.ajax({
				url: "/uploadAjaxAction",
				processData: false, 
				contentType: false,
				data:formData,
				type:"post",
				dataType: "json",
				success: function(result){
					console.log(result);
					showUploadedFile(result);

					$(".uploadDiv").html(cloneObj.html());

				}
			});
		});

		$(".uploadResult").on("click", "span", function(){
			let targetFile = $(this).data("file");
			let type = $(this).data("type");

			$.ajax({
				url: '/deletedFile',
				data: {fileName: targetFile, type: type},
				dataType: 'text',
				type: 'POST',
				success: function(result) {
					alert(result);
				}
			});
		});
	});

</script>
</body>
</html>