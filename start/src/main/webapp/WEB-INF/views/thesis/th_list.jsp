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
<link rel="stylesheet" href="../resources/css/thesis/th_list.css">
<title>Insert title here</title>
<script src="../resources/js/util.js" type="text/javascript"></script>
<script>
function fncWrite() {
	//location.href = "/th_write.do";
	gfnOpenPop('/th_write.do', '논문 등록', '880', '430');
}
function fncView(idx) {
	gfnOpenPop('/th_detail.do?th_bno=' + idx, '상세보기', '880', '430');
	//location.href = "/th_detail.do?th_bno=" + idx;
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
							
							
							
							<h1>Thesis</h1>
							<h4>- Thesis Board. -</h4>
							<c:choose>
								<c:when test="${not empty sessionScope.userLoginInfo }">
									<a href="#this" onclick="fncWrite()">논문 등록하기</a>
								</c:when>
							</c:choose>
							
							<div id="content_wrap">
							
							
							<c:choose>
								<c:when test="${fn:length(th_boardList) > 0}">
									<table frame=void>
									<thead>
										<tr>
											<th id="th_bno">no.</th>
											<th id="th_writer">writer.</th>
											<th id="th_name">name.</th>
											<th id="th_isti">institution.</th>
											<th id="th_page">page.</th>
											<th id="th_date">public.</th>
										</tr>
									</thead>
									
											<tbody>	
											<c:forEach varStatus="rowIndex" begin="0" end="${fn:length(th_boardList)-1}">											
												<tr onclick="fncView('${th_boardList[rowIndex.index].th_bno}')" style="cursor:pointer;">
													<td>${rowIndex.index + 1}.</td>
													<td>
														<c:choose>
															<c:when test="${fn:length(th_boardList[rowIndex.index].th_writerNames) > 0 }">
																<c:forEach var="writer" items="${th_boardList[rowIndex.index].th_writerNames}">
																	${writer},&nbsp;
																</c:forEach>
															</c:when>
															<c:otherwise>
																${th_boardList[rowIndex.index].th_writer}
															</c:otherwise>
														</c:choose>
													</td>
													<td class="td_name">${th_boardList[rowIndex.index].th_name}</td>
													<td>${th_boardList[rowIndex.index].th_insti_name }</td>
													<td>${th_boardList[rowIndex.index].th_page }</td>
													<td>${th_boardList[rowIndex.index].th_public_date}</td>
												</tr>
												
											</c:forEach>
											</tbody>
									</table>
								</c:when>
								<c:otherwise>
									등록 된 논문이 없습니다.
								</c:otherwise>
							</c:choose>
								
							</div>
						</div>
					</div>
				
					
					<div class="text - center">
						<ul class="pagination">
							
							<li><a href="?page=1"><i class="fa fa-chevron-left"></i><i class="fa fa-chevron-left"></i></a></li>
							<c:if test="${pageMaker.prev}">
								<li><a href="?page=${pageMaker.startPage -1}"><i class="fa fa-chevron-left"></i></a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage}" var="idx">

								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':'' }"/>>
									<a href="?page=${idx}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
								<li><a href="?page=${pageMaker.endPage +1}"><i class="fa fa-chevron-right"></i></a></li>
							</c:if>
							<li><a href="?page=${pageMaker.endPage }"><i class="fa fa-chevron-right"></i><i class="fa fa-chevron-right"></i></a></li>

						</ul>
					</div>
					 
					
				
				</div>
			</div>
		</div>
	</div>
</div>

</body>
<jsp:include page="/WEB-INF/views/include/footer.jsp" flush="true" />