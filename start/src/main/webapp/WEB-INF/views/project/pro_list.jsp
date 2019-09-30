<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true" %>

<jsp:include page="/WEB-INF/views/include/home.jsp" flush="true" />
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="true" />
<script src="../resources/js/util.js" type="text/javascript"></script>

<script type="text/javascript">
	function fncWrite() {
		gfnOpenPop('/pro_write.do', '등록', '736', '400');
	}
	function fncView(idx){
		gfnOpenPop('/toc_board/toc_read.do?toc_bno=' + idx,'상세보기','736','500');
	}
	function fncImgName(idx){
		
	}
</script>
<html>
<head>
	<title>★Mojuk_project★</title>
	<link rel="stylesheet" href="../resources/css/project/project.css">
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
							
							
							
							<h1>Project</h1>
							<h4>- Show us. Your project of nice. -</h4>
							
							<c:choose>
								<c:when test="${not empty sessionScope.userLoginInfo }">
									<a class="button" onclick="fncWrite()">
										<strong>등록</strong>
									</a>		
								</c:when>
							</c:choose>
							
							
							<div class="card_wrap">
								<c:choose>
									<c:when test="${fn:length(pro_boardList)-1 >= 0}">
										<c:forEach varStatus="rowIndex" begin="0" end="${fn:length(pro_boardList)-1}">
										<div class="card" onclick="fncView('${pro_boardList[rowIndex.index].toc_bno}');">
												<!-- C:\Users\YeJi\Documents\workspace-spring-tool-suite-4-4.1.2.RELEASE\mojuk\start\src\main\webapp\WEB-INF\views\project -->
												<img src="data:image/png;base64,${pro_imges[rowIndex.index]}" class="test_img" 
												alt="data:image/png;base64,${pro_imges[rowIndex.index]}"/>
											<span>
												<p>${pro_boardList[rowIndex.index].toc_title}</p>
												<p>_ ${pro_boardList[rowIndex.index].toc_writer} _</p>
											</span>
										</div>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<p>등록된 Project가 없습니다.</p>
									</c:otherwise>
								</c:choose>
								
								

							
							
							
						</div>
					</div>
					<%-- <c:if test="${sessionScope.LOGIN_BELONG eq '네비게이션'}"> --%>
						
					<%-- </c:if> --%>
				</div>

			</div>
		</div>
		<!--End Content-->
	</div>
</div>
<!--End Container-->
</div>

</body>

</html>
<jsp:include page="/WEB-INF/views/include/footer.jsp" flush="true" />