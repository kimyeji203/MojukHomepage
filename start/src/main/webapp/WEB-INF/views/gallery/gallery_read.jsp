<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page session="true" %>
<jsp:include page="/WEB-INF/views/include/home.jsp" flush="true" />
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="true" />

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../resources/css/gallery/gallery.css">

<title>Insert title here</title>
</head>

<script src="http://code.jquery.com/jquery.js"></script>
<script>
function fn_delete(gallery_bno){
	if(confirm("삭제하시겠습니까?")){
		location.href="/gallery_delete.do?bno=" + gallery_bno;
	}
}

function fn_update(){
	if(confirm("수정하시겠습니까?")){
		if(fn_check()){
			document.galleryForm.submit();
		}
	}
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
							<form name="galleryForm" action="/gallery_modify.do" method="post">
							
							
								<!-- input data -->
								<input type="hidden" name="board_no" id="title" class="form-control" value="${readOne.readInfo.board_no }" />
								<input type="hidden" name="gallery_title" value="${readOne.readInfo.gallery_title }">
								<input type="hidden" name="gallery_writer" value="${readOne.readInfo.gallery_writer }">
								<input type="hidden" name="gallery_redate" value="${readOne.readInfo.gallery_redate }">
								<input type="hidden" name="gallery_content" value="${reaOne.readInfo.gallery_content} }">
								
								
								<!-- user form -->
								<table id="read_table">
									<tr>
										<td class="td_title"><span style="font-weight:700;">제목</span></td>
										<td colspan="3">${readOne.readInfo.gallery_title }</td>
									</tr>
									<tr>
										<td class="td_title"><span style="font-weight:700;">작성자</span></td>
										<td>${readOne.readInfo.gallery_writer }</td>
										<td class="td_title"><span style="font-weight:700;">작성일</span></td>
										<td style="width:20%;">${readOne.readInfo.gallery_redate }</td>
									</tr>
									<tr>
										<td colspan="4" style="padding:5%;">
											<c:choose>
												<c:when test="${fn:length(readOne.readImages)-1 >= 0 }">
													<c:forEach var="readImg" items="${readOne.readImages}" varStatus="status">
														<div class="read_imgBox">
															<div class="read_imgDiv">
																<img src="data:image/png;base64,${readImg.imgSrc}" class="read_img" 
																alt="data:image/png;base64,${readImg.imgSrc}"/>
															
															</div>
															<span>${readImg.imgTitle}</span>
														</div>
													</c:forEach>
												</c:when>
												<c:otherwise>
													등록 된 사진이 없습니다.
												</c:otherwise>
											</c:choose>
											<br>${readOne.readInfo.gallery_content }
										</td>
									</tr>
								</table>
								<div class="button_rtbox">
									<input type="button" class="button bt02" onclick="location.href='/gallery.do';" value="목록">
							
									<c:choose>
										<c:when test="${not empty sessionScope.userLoginInfo }">
											<input type="button" class="button bt02" onclick="location.href='/gallery_write.do;'"value="쓰기">
										</c:when>
										
									</c:choose>
									<input type="button" class="button bt01" onclick="fn_update()" value="수정">
									<input type="button" class="button bt01" onclick="fn_delete('${readOne.readInfo.board_no}')" value="삭제">
						
										
								</div>
								</form>
							</div>
</div></div></div></div></div></div></div> 
</body>
<!-- In Content End -->

</html>
<jsp:include page="/WEB-INF/views/include/footer.jsp" flush="true" />