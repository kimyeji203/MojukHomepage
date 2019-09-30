<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true" %>

<jsp:include page="/WEB-INF/views/include/home.jsp" flush="true" />
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="true" />


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="../resources/css/participate/parti_check.css">
<title>Insert title here</title>
</head>


<script src="http://code.jquery.com/jquery.js"></script>
<script>
$(document).ready(function(){
	$("input[name='two_in']:radio[value='${parti_one.two_in}']").prop('checked',true);
	$("input[name='three_in']:radio[value='${parti_one.three_in}']").prop('checked',true);

	if("${parti_one.one_in_one_now}" != ""){
		$("#one_in_one_now").val("${parti_one.one_in_one_now}").prop("selected",true);
	}
	if("${parti_one.one_in_two_now}" != ""){
		$("#one_in_two_now").val("${parti_one.one_in_two_now}").prop("selected",true);
	}
	


	var today = new Date();
	var strDate = "";
	var dateArr = "";
	var dateCompare = new Date();
	
	$("#one_in_one_now").change(function(){
		if($(this).val() == '2'){
			strDate = $("#oneIn1_date").val();
			dateArr = strDate.split('-');
			dateCompare = new Date(dateArr[0],parseInt(dateArr[1])-1,dateArr[2]);
			if(dateCompare.getTime() > today){
				alert('현시각 이후 시점의 특강은 이수완료로 설정 할 수 없습니다.');
				$("#one_in_one_now").val("0").prop("selected",true);
			}
		}
	});

	$("#one_in_two_now").change(function(){
		if($(this).val() == '2'){
			strDate = $("#oneIn2_date").val();
			dateArr = strDate.split('-');
			dateCompare = new Date(dateArr[0],parseInt(dateArr[1])-1,dateArr[2]);
			if(dateCompare.getTime() > today){
				alert('현시각 이후 시점의 특강은 이수완료로 설정 할 수 없습니다.');
				$("#one_in_two_now").val("0").prop("selected",true);
			}
		}
	});

	$("#oneIn1_date").change(function(){
		
		if($("#one_in_one_now").val() == '2'){
			strDate = $("#oneIn1_date").val();
			dateArr = strDate.split('-');
			dateCompare = new Date(dateArr[0],parseInt(dateArr[1])-1,dateArr[2]);
			if(dateCompare.getTime() > today){
				alert('현시각 이후 시점의 특강은 이수완료로 설정 할 수 없습니다.');
				$("#one_in_one_now").val("0").prop("selected",true);
			}
		}
	});
	$("#oneIn2_date").change(function(){
		if($("#one_in_two_now").val() == '2'){
			strDate = $("#oneIn2_date").val();
			dateArr = strDate.split('-');
			dateCompare = new Date(dateArr[0],parseInt(dateArr[1])-1,dateArr[2]);
			if(dateCompare.getTime() > today){
				alert('현시각 이후 시점의 특강은 이수완료로 설정 할 수 없습니다.');
				$("#one_in_two_now").val("0").prop("selected",true);
			}
		}
	});
	
});





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
							
							<form action="/parti_update.do" method="post" id="parti_form">
								<input type="hidden" name="stu_num" value="${parti_one.stu_num}">
								<a href="/participate.do">돌아가기</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								<a href="#this" onclick="document.getElementById('parti_form').submit();">현황 저장</a>
								
								<div id="pa_wrap">
									<table>
										<tr>
											<th class="tbt">학  번</th><td colspan="4">${parti_one.stu_num}</td>
											<th class="tbt">이  름</th><td>${parti_one.stu_name}</td>
										</tr>
										<tr>
											<th class="tbt" rowspan="2">1-in</th>
											<td class="tdt">특강 이름</td>
											<td><input type="text" class="tbx" name="one_in_one_name" value="${parti_one.one_in_one_name}"></td>
											<td class="tdt">날  짜</td>
											<td><input type="date" id="oneIn1_date" name="one_in_one_date" value="${parti_one.one_in_one_date}"></td>
											<td class="tdt">신청/이수 현황</td>
											<td>
												<select name="one_in_one_now" id="one_in_one_now">
													<option value="0" selected>선      택</option>
													<option value="1">신청완료</option>
													<option value="2">이수완료</option>
												</select>
											</td>
										</tr>
										<tr>
											<td class="tdt">특강 이름</td>
											<td><input type="text"  class="tbx" name="one_in_two_name" value="${parti_one.one_in_two_name }"></td>
											<td class="tdt">날  짜</td>
											<td>
												<input type="date" id="oneIn2_date" name="one_in_two_date" 
												value="${parti_one.one_in_two_date}">
											</td>
											<td class="tdt">신청/이수 현황</td>
											<td>
												<select name="one_in_two_now" id="one_in_two_now">
													<option value="0" selected>선      택</option>
													<option value="1">신청완료</option>
													<option value="2">이수완료</option>
												</select>
											</td>
										</tr>
										<tr>
											<th class="tbt">2-in</th>
											<td colspan="10">
												<input type="radio" name="two_in" value="">&nbsp;&nbsp;선택 안함<br>
												<input type="radio" name="two_in" value="SOC">&nbsp;&nbsp;SOC 들어오는 노트 공모전<br>
												<input type="radio" name="two_in" value="POM">&nbsp;&nbsp;POM나는 경진 대회<br>
												<input type="radio" name="two_in" value="WOW">&nbsp;&nbsp;WOW 캠프
											</td>
										</tr>
										<tr>
											<th class="tbt">3-in</th>
											<td colspan="10">
												<input type="radio" name="three_in" value="">&nbsp;&nbsp;선택 안함<br>
												<input type="radio" name="three_in" value="TOC">&nbsp;&nbsp;TOC튀는 멘토링<br>
												<input type="radio" name="three_in" value="FLY">&nbsp;&nbsp;FLY튜터링
											</td>
										</tr>
									</table>
								
							</div>
							</form>
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