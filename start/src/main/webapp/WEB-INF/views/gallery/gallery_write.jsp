<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true" %>

<jsp:include page="/WEB-INF/views/include/home.jsp" flush="true" />
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="true" />

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../resources/css/gallery/gallery.css">
<script src="http://code.jquery.com/jquery.js"></script>
<title>Insert title here</title>
</head>

<script>

	var gfv_count = 0;

	$(document).ready(function() {
		$("#addFile").on("click", function(e) { //파일 추가 버튼
			e.preventDefault();
			fn_addFile();
		});

		$("a[name='delete']").on("click", function(e) { //삭제 버튼
			e.preventDefault();
			fn_deleteFile($(this));
		});
	});

	function fn_addFile() {
		gfv_count = gfv_count + 1;
		var str = "";
		str ="<div id='fileinfo'>"
				+"<input type='text' class='fileTitle' name='file["+gfv_count+"].gallery_img_title' placeholder='이미지 제목'>"
				+"<input type='file' class='fileInput' accept='image/*' id='"+ gfv_count +"' name='file["+ gfv_count +"].gallery_img_multi'>"
				+ "</div>";
		$("#fileDiv").append(str);
		$("a[name='delete']").on("click", function(e) { //삭제 버튼
			e.preventDefault();
			fn_deleteFile($(this));
		});
	
	}

	function fn_deleteFile(obj) {
		obj.parent().remove();
	}

	function fn_check(){

	}
</script>
 
 <body>
 <!--Start Container-->
	<div id="main" class="container-fluid">
	<div class="row">
		<!--Start Content-->
		<div id="content" class="col-xs-12 col-sm-12">
			<div id="ajax-content">
				<div class="parallax-content baner-content" id="home">
					<div class="container">
						<div class="row">
							
							
							
							<h1>Gallery</h1>
							<h4>- Let`s upload that pictures. -</h4>
							
							<div id="gallery_wrap">
							<form name="gallery_form" id="gallery_form" action="/gallery_register.do" enctype="multipart/form-data" method="post">
								<table>
									<tbody>
									<colgroup>
										<col width="150px">
										<col width="*">
									</colgroup>
									<tr>
										<th>제&nbsp;&nbsp;목</th>
										<td>
											<input type="text" style="width: 100%;" placeholder="제목을 입력하세요." name="gallery_title" id="gallery_title" class="form-control"/>
										</td>
									</tr>
									<tr>
										<th>작&nbsp;성&nbsp;자</th>
										<td>
											<input type="text" name="gallery_writer" id="gallery_name" class="form-control" value="${sessionScope.userLoginInfo.stu_name }" readonly/>
											<input type="hidden" name="gallery_writer_id" value="${sessionScope.userLoginInfo.stu_no }">
										</td>
									</tr>
									<tr>
										<td colspan="2">
											<textarea rows="20" placeholder="내용을 입력하세요." name="gallery_content" id="gallery_content" class="form-control"></textarea>
										</td>
									</tr>
								</table>
								<div class="photo_files">
									<div class="photo_file">
											
											
											<div id="fileDiv"> 
												<a href="#this" id="addFile">파일추가</a><br>
												<div id="fileinfo">
													<input type='text' class="fileTitle" name='file[0].gallery_img_title' placeholder='이미지 제목'>
											
													<input type="file" id="file" class="fileInput" name="file[0].gallery_img_multi" accept="image/*">
												</div>
											</div>
									</div>
								</div>
								
								<div class="button_rtbox">
									<button type="submit" class="button bt01" onclick="fn_check();">등록</button>
									<input type="button" class="button bt01" onclick="location.href='/gallery.do';" value="취소">
								</div>
							</form>
							</div>
</div></div></div></div></div></div></div> 
</body>
<!-- In Content End -->

</html>
<jsp:include page="/WEB-INF/views/include/footer.jsp" flush="true" />