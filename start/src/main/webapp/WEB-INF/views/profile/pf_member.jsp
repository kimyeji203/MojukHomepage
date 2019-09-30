<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page session="true" %>

<jsp:include page="/WEB-INF/views/include/home.jsp" flush="true" />
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="true" />

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>profile</title>

<link rel="stylesheet" href="../resources/css/profile/profile.css">
</head>

<script src="../resources/js/util.js" type="text/javascript"></script>
<script>
function fcnWriteProfile(){
	gfnOpenPop('/pf_write.do', '등록', '736', '610');
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
							
							
							
							<h1>Member of the <span style="color:#75753c">MOJUK</span></h1>
							<h4>- All members of the past. -</h4>
							
							<a href="/profile.do">모죽 조직도 보기</a>
							<c:choose>
								<c:when test="${not empty sessionScope.userLoginInfo }">
									&nbsp;&nbsp;|&nbsp;&nbsp;
									<a href="#this" onclick="fcnWriteProfile()">프로필 작성하기</a>		
								</c:when>
							</c:choose>
							<div id="pf_wrap">
							
								
									<c:choose>
										<c:when test="${fn:length(memberList)-1 >= 0}">
											<c:forEach var="me" items="${memberList}" varStatus="status">
											
												<table class="member_tables">
													<tr><!-- src="data:image/png;base64,${me.my_img}" -->
														<td rowspan="3" class="td_img"><img class="pf_img" src="data:image/png;base64,${me.my_img}" /></td>
														<td>${me.my_info.pf_stu_name }</td>
														<td>${me.my_info.pf_stu_no}</td>
													</tr>
													<tr>
														<td colspan="2">생년월일 : ${me.my_info.pf_stu_birthday}</td>
													</tr>
													<tr>
														<td colspan="2">이메일 : ${me.my_info.pf_stu_email}</td>
													</tr>
													
													<c:choose>
														<c:when test="${fn:length(me.my_edu)-1 >= 0}">
															<tr>
																<td class="td_title">학력</td>
																<td colspan="2">
																	<c:forEach var="meEdu" items="${me.my_edu}" varStatus="status">
																		${status.index + 1}.&nbsp;&nbsp;&nbsp;&nbsp;
																		${meEdu.university }&nbsp;&nbsp;&nbsp;&nbsp;
																		${meEdu.depart}<br>
																	</c:forEach>
																</td>
															</tr>
														</c:when>
													</c:choose>
													<c:choose>
														<c:when test="${fn:length(me.my_ac) -1 >= 0 }">
															<tr>
																<td class="td_title">수상 및 자격증</td>
																<td colspan="2">수상 내역<br>
																	<c:forEach var="meAc" items="${me.my_ac }" varStatus="status">
																				<c:choose>
																					<c:when test="${meAc.type == 'award' }">
																							- &nbsp;&nbsp;&nbsp;&nbsp;
																							${meAc.name }&nbsp;&nbsp;&nbsp;&nbsp;
																							${meAc.host}&nbsp;&nbsp;&nbsp;&nbsp;
																							${meAc.date } 취득<br>
																					</c:when>
																				</c:choose>
																	</c:forEach>
																	<br>취득 자격증<br>
																	<c:forEach var="meAc" items="${me.my_ac }" varStatus="status">
																			<c:choose>
																				<c:when test="${meAc.type == 'certificate' }">
																						- &nbsp;&nbsp;&nbsp;&nbsp;
																						${meAc.name }&nbsp;&nbsp;&nbsp;&nbsp;
																						${meAc.host}&nbsp;&nbsp;&nbsp;&nbsp;
																						${meAc.date }취득<br>
																				</c:when>
																			</c:choose>
																	</c:forEach>
																	</td>
															</tr>
																	
														</c:when>
													</c:choose>
													<c:choose>
														<c:when test="${fn:length(me.my_thesis) -1 >=0 }">
															<tr>
																<td class="td_title">논문</td>
																<td colspan="2">
																	<c:forEach var="meTh" items="${me.my_thesis }" varStatus="status">
																		<i>${status.count }.&nbsp;&nbsp;${meTh.th_name },&nbsp;${meTh.th_insti_name },&nbsp;${meTh.th_page },&nbsp;${meTh.th_public_date },&nbsp;[${meTh.th_group } public]</i><br>
																	</c:forEach>
																</td>
															</tr>
														</c:when>
													</c:choose>
													
												</table>
											
											</c:forEach>
										</c:when>
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