<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="true" %>
<link rel="stylesheet" href="../resources/css/board/common.css">
<link rel="stylesheet" href="../resources/css/board/default.css">
<link rel="stylesheet" href="../resources/css/board/content.css">
<link rel="stylesheet" href="../resources/css/thesis/th_wr.css">

<jsp:include page="/WEB-INF/views/include/home.jsp" flush="true" />
<script src="http://code.jquery.com/jquery.js"></script>
<script src="<c:url value='../resources/js/common.js'/>" charset="utf-8"></script>

<script>
function fn_delete(th_bno){
	if(confirm("삭제하시겠습니까?")){
		location.href="/th_delete.do?th_bno=" + th_bno;
	}
}

function fn_update(){
	if(confirm("수정하시겠습니까?")){
		if(fn_check()){
			document.updateForm.submit();
		}
	}
}

function fn_check(){
	if($("#title").val().trim() == ''
		|| $("#insti_name").val().trim() == ''
		|| $("#member").val().trim() == ''
		|| $("#date").val().trim() == ''){
		alert("모든 정보를 입력하시기 바랍니다.");
		return false;
	}else{
		return true;
	}
}
</script>
<body>
<div class="pop_wrap" id="pupUpLayerId">
								<div class="pop_tit">
									<span>논문 상세 보기</span>
								</div>
								<div class="pop_content">
									<form name="updateForm" id="update_form" action="/th_update.do" method="post" >
										<input type="hidden" name="th_bno" value="${map.th_bno }">
										<table class="pop_table">
											<tbody>
												<colgroup>
													<col width="150px">
													<col width="*">
												</colgroup>
												<tr>
													<th>논문 이름</th>
													<td colspan="3">
														<input type="text" name="th_name" id="title" class="form-control" value="${map.th_name }"/>
													</td>
												</tr>
												<tr>
													<th>논문 학회</th>
													<td>
														<c:choose>
															<c:when test="${map.th_institution eq 'journal'} ">
																<input type="radio" name="th_institution" value="journal" checked="checked">&nbsp;&nbsp;저널&nbsp;&nbsp;&nbsp;&nbsp;
																<input type="radio" name="th_institution" value="academic">&nbsp;&nbsp;학술
															</c:when>
															<c:otherwise>
																<input type="radio" name="th_institution" value="journal">&nbsp;&nbsp;저널&nbsp;&nbsp;&nbsp;&nbsp;
																<input type="radio" name="th_institution" value="academic" checked="checked">&nbsp;&nbsp;학술
															</c:otherwise>
														</c:choose>
														
													</td>
													<td colspan="2">
														<input type="text" name="th_insti_name" id="insti_name" class="form-control" value="${map.th_insti_name }"/>
													</td>
												</tr>
												<tr>
													<th>작업 규모</th>
													<td> 
														<c:choose>
															<c:when test="${map.th_group eq 'group' }">
																<input type="radio" name="th_group" value="group" checked='checked'>&nbsp;&nbsp;그룹&nbsp;&nbsp;&nbsp;&nbsp;
																<input type="radio" name="th_group" value="individual">&nbsp;&nbsp;개인
															</c:when>
															<c:otherwise>
																<input type="radio" name="th_group" value="group">&nbsp;&nbsp;그룹&nbsp;&nbsp;&nbsp;&nbsp;
																<input type="radio" name="th_group" value="individual" checked='checked'>&nbsp;&nbsp;개인
															</c:otherwise>
														</c:choose>
													</td>
													<th>논문 작성자 </th>
													<td>
															<table id="writerInfo" frame=void>
																	<c:forEach var="writer" items="${writers}" varStatus="status">
																		<tr>
																			<td><input type="text" class="writer" name="th_writers[${status.index}].th_stu_no" value="${writer.th_stu_no}"></td>
																			<td><input type="text" class="writer" name="th_writers[${status.index}].th_stu_name" value="${writer.th_stu_name }"></td>
																		</tr>
																	</c:forEach>
															</table>
													</td>
														
												</tr>
												<tr>
													<th>논문 기록</th>
													<td>
														<input type="text" name="th_page" id="member" class="form-control" value="${map.th_page}"/>
													</td>
													<th>출판 날짜</th>
													<td>
														<input type="date" name="th_public_date" id="date" class="form-control" value="${map.th_public_date}"/>
													</td>
												</tr>
												
		
											</tbody>
										</table>
										<div class="button_rtbox">
											<span class="button bt02"><button class="bt01" onclick="window.close()">닫기</button></span>
											
											<c:choose>
												<c:when test="${not empty sessionScope.userLoginInfo}">
												
													<c:forEach var="writer" items="${writers}" varStatus="status">
														<c:choose>
															<c:when test="${sessionScope.userLoginInfo.stu_no eq writer.th_stu_no  }">
																<span class="button bt02"><input type="button" class="bt01" onclick="fn_update()" value="수정"></span>
																<span class="button bt01"><input type="button" class="bt01" onclick="fn_delete('${map.th_bno}')" value="삭제"></span>
															</c:when>
														</c:choose>
													</c:forEach>
													
												</c:when>
											</c:choose>
											
										</div>
									</form>
									
								</div>
								</div>

								


</body>

