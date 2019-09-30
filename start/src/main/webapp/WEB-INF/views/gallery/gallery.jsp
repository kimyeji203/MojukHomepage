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
<meta charset="utf-8">
<link rel="stylesheet" href="../resources/css/gallery/gallery.css">
<title>Insert title here</title>
</head>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script>
function fn_galleryRead(board_no){
	location.href="/gallery_read.do?bno=" + board_no;
}

</script>
<body>

<!--Start Container-->
	<div id="main" class="container-fluid">
	<div class="row">
		<!--Start Content-->

			<div id="ajax-content">
				<div class="parallax-content baner-content" id="home">
					<div class="container">
						<div class="row">
							
							
							
							<h1>Gallery</h1>
							<h4>- Our Activities. -</h4>
							
							<div id="gallery_wrap">
							
							<c:choose>
								<c:when test="${not empty sessionScope.userLoginInfo }">
									<div id="menu_wrap">
										<a href="/gallery_write.do">갤러리 게시물 쓰기</a>
									</div>
								</c:when>
							</c:choose>
								
								<hr>
								<div>
									<form name="gallery_form" action="#" method="get">
									<c:choose>
										<c:when test="${fn:length(galleryList)-1 >= 0}">
											<c:forEach var="galleryOne" items="${galleryList}" varStatus="status">
												<div class="card" onclick="fn_galleryRead('${galleryOne.galleryInfo.board_no}')">
													<div class="img_box"><img src="data:image/png;base64,${galleryOne.mainImg}" class="img" 
														alt="data:image/png;base64,${galleryOne.mainImg}"/></div>
													<span>${galleryOne.galleryInfo.gallery_title }</span>
												</div>
											</c:forEach>
										</c:when>
										<c:otherwise>
											아직 업로드 된 사진이 없습니다.
										</c:otherwise>
									</c:choose>
									</form>
								</div>
							</div>
							
</div></div></div></div></div></div>
</body>
</html>
<jsp:include page="/WEB-INF/views/include/footer.jsp" flush="true" />