<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false" %>

<jsp:include page="/WEB-INF/views/include/home.jsp" flush="true" />
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="true" />


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="../resources/css/useful_link/us_link.css">
<title>Insert title here</title>
<script src="../resources/js/util.js" type="text/javascript"></script>
<script>
function fncWrite() {
	gfnOpenPop('/us_write.do', '링크 등록', '736', '400');
}
</script>

</head>
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
							
							
							
							<h1>Link of useful source</h1>
							<h4>- Here are link of useful source. -</h4>
							
							<a href="#this" onclick="fncWrite()">링크 등록하기</a>
							<div id="us_wrap">
								<c:choose>
									<c:when test="${fn:length(useful_board)-1 >= 0}">
										<c:forEach varStatus="rowIndex" begin="0" end="${fn:length(useful_board)-1}">
											<a href="${useful_board[rowIndex.index].us_link }" target="_blank" title="해당 링크로 넘어갑니다.">
												<div class="link_card">
													<h3>${useful_board[rowIndex.index].us_title }</h3>
													<p>${useful_board[rowIndex.index].us_writer }</p>
													<p>${useful_board[rowIndex.index].us_link }</p>	
												</div>
											</a>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<p>등록된 Link가 없습니다.</p>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
<jsp:include page="/WEB-INF/views/include/footer.jsp" flush="true" />