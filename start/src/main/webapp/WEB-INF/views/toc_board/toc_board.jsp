<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="../resources/js/util.js" type="text/javascript"></script>

<jsp:include page="/WEB-INF/views/include/home.jsp" flush="true" />
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="true" />


<script>
function fncWrite() {
	 <%-- if('<%=session.getAttribute("LOGIN_ID")%>' == "null") {
			alert("로그인후 이용해주세요.");
			location.href='/loginHome';
			return false;
		} else { --%>
			gfnOpenPop('/toc_write.do', '등록', '736', '500');
			 /* return false; 
		}
	return false; */
}
function fncView(idx) {
	<%--  if('<%=session.getAttribute("LOGIN_ID")%>' == "null") {
			alert("로그인후 이용해주세요.");
			location.href='/loginHome';
			return false;
		} else { --%>
			gfnOpenPop('/toc_board/toc_read.do?toc_bno=' + idx, '상세보기', '736', '500');
		/* 	return false;
		}
	
	return false; */
}
</script>

 
 
<!--Start Container-->
<div id="main" class="container-fluid">
	<div class="row">
		<!--Start Content-->
		<div id="content" class="col-xs-12 col-sm-12">
			<div id="ajax-content">
				<div class="parallax-content baner-content" id="home">
					<div class="container">
						<div class="row">
							<table>
								<thead>
									<tr>
										<th>번호</th>
										<th>분류</th>
										<th>제목</th>
										<th>작성자</th>
										<th>시간</th>
									</tr>
								</thead>
								<c:choose>
									<c:when test="${fn:length(toc_boardList)-1 >= 0}">
										<c:forEach end="${fn:length(toc_boardList)-1}" begin="0"
											varStatus="rowIndex">
											<!-- toc_boardList: controller에서 만든 목록 model.addAttribute -->
											<tbody>												
													<tr>
													<td>
													${toc_boardList[rowIndex.index].toc_bno}</td>
													<td>${toc_boardList[rowIndex.index].toc_belong}</td>
													<td><a href="#" onclick="fncView('${toc_boardList[rowIndex.index].toc_bno}');">${toc_boardList[rowIndex.index].toc_title}</a></td>
													<td>${toc_boardList[rowIndex.index].toc_writer}</td>	
													<td>${toc_boardList[rowIndex.index].toc_regdate}</td>
													
												</tr>
												
											</tbody>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="5">조회된 결과가 없습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</table>
						</div>
					</div>


					<div class="text - center">
						<ul class="pagination">

							<c:if test="${pageMaker.prev}">
								<li><a href="?page=${pageMaker.startPage -1}">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage}" var="idx">

								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':'' }"/>>
									<a href="?page=${idx}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
								<li><a href="?page=${pageMaker.endPage +1}">&raquo;</a></li>
							</c:if>

						</ul>
					</div>



					<%-- <c:if test="${sessionScope.LOGIN_BELONG eq '네비게이션'}"> --%>
						<a class="button" onclick="fncWrite()">
							<strong>등록</strong>
						</a>
					<%-- </c:if> --%>
				</div>

			</div>
		</div>
		<!--End Content-->
	</div>
</div>
<!--End Container-->

