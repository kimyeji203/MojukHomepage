<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true" %>

<jsp:include page="/WEB-INF/views/include/home.jsp" flush="true" />
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="true" />


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="../resources/css/participate/participate.css">
<title>Insert title here</title>
</head>

<script src="http://code.jquery.com/jquery.js"></script>

<script>



</script>
<script>
function fcnPartiCheck(){
	location.href = "/parti_check.do";
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
							
							
							
							<h1>Participate</h1>
							<h4>- Let`s check your participate. -</h4>
							<c:choose>
								<c:when test="${not empty sessionScope.userLoginInfo }">
									<a href="#this" onclick="fcnPartiCheck()">3-in 체크 하기</a>		
								</c:when>
							</c:choose>
							
							<div id="pa_wrap">
								<table>
									<tr>
										<th>학 번</th>
										<th>이 름</th>
										<th class="onein">1-in</th>
										<th class="twoin">2-in</th>
										<th class="threein">3-in</th>
										<th>인증 여부</th>
									</tr>
									
									<c:forEach varStatus="rowIndex" begin="0" end="${fn:length(parti_all)-1}">
										<tr>
											<td rowspan="2">${parti_all[rowIndex.index].stu_num}</td>
											<td rowspan="2">${parti_all[rowIndex.index].stu_name}</td>
											<td>1.&nbsp;&nbsp;&nbsp;${parti_all[rowIndex.index].one_in_one_name}</td>
											
											
											<td rowspan="2">
												<c:choose>
													<c:when test="${parti_all[rowIndex.index].two_in =='SOC'}">
														SOC 들어오는 노트 공모전
													</c:when>
													<c:when test="${parti_all[rowIndex.index].two_in =='POM'}">
														POM나는 경진 대회
													</c:when>
													<c:when test="${parti_all[rowIndex.index].two_in =='WOW'}">
														WOW 캠프
													</c:when>
													<c:otherwise>
														-
													</c:otherwise>
												</c:choose>
											</td>
											<td rowspan="2">
												<c:choose>
													<c:when test="${parti_all[rowIndex.index].three_in =='FLY'}">
														FLY 튜터링
													</c:when>
													<c:when test="${parti_all[rowIndex.index].three_in =='TOC'}">
														TOC튀는 멘토링
													</c:when>
													<c:otherwise>
														-
													</c:otherwise>
												</c:choose>
											
											
											</td>
											<td rowspan="2">
												<c:choose>
													<c:when test="${parti_all[rowIndex.index].one_in_one_now == '2' 
																	and parti_all[rowIndex.index].one_in_two_now == '2'
																	and parti_all[rowIndex.index].two_in != ''
																	and parti_all[rowIndex.index].three_in != ''}">
														<span style="color:#0080c0; font-weight:bold;">인증 완료</span>
													</c:when>
													<c:otherwise>
														미 인증
													</c:otherwise>
												</c:choose>
											
											</td>
										</tr>
										<tr><td>2.&nbsp;&nbsp;&nbsp;${parti_all[rowIndex.index].one_in_two_name}</td></tr>
									</c:forEach>
									
								</table>
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