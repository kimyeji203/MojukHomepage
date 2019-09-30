<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.PrintWriter"%>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="../resources/css/board/common.css">
<link rel="stylesheet" href="../resources/css/board/default.css">
<link rel="stylesheet" href="../resources/css/board/content.css">
<link rel="stylesheet" href="../resources/css/thesis/th_wr.css">

<script>
var count = 1;
function fncAddWriter(){
	var str = "<tr><td><input type='text' name='th_writers["+ (count) +"].th_stu_no' class='form-control' placeholder='학번'></td>"
			 + "<td><input class='form-control' type='text' name='th_writers["+(count++)+ "].th_stu_name' placeholder='이름'></td>"
			 + "<td><a href='#this' name='delete'>삭제</a></td></tr>";
    $("#writerInfo").append(str);
    $("a[name='delete']").on("click", function(e){ //삭제 버튼
        e.preventDefault();
        fnDel($(this));
    });
}

function fnDel(obj){
    obj.parent().parent().remove();
}

</script>


<body>
<div class="pop_wrap" id="pupUpLayerId">
								<div class="pop_tit">
									<span>논문 등록</span>
								</div>
								<div class="pop_content">
									<form action="/th_register.do" method="post">
										<table class="pop_table">
											<tbody>
												<colgroup>
													<col width="150px">
													<col width="*">
												</colgroup>
												<tr>
													<th>논문 이름</th>
													<td colspan="3">
														<input type="text" name="th_name" id="title" class="form-control" placeholder="논문 이름"/>
													</td>
												</tr>
												<tr>
													<th>논문 학회</th>
													<td>
														<input type="radio" name="th_institution" value="journal">&nbsp;&nbsp;저널&nbsp;&nbsp;&nbsp;&nbsp;
														<input type="radio" name="th_institution" value="academic">&nbsp;&nbsp;학술
													</td>
													<td colspan="2">
														<input type="text" name="th_insti_name" id="insti_name" class="form-control" placeholder="저널 or 학술 명"/>
													</td>
												</tr>
												<tr>
													<th>작업 규모</th>
													<td> <!-- th_group -->
														<input type="radio" name="th_group" value="group">&nbsp;&nbsp;그룹&nbsp;&nbsp;&nbsp;&nbsp;
														<input type="radio" name="th_group" value="individual">&nbsp;&nbsp;개인
													</td>
													<th>논문 작성자 &nbsp;&nbsp;&nbsp;<a href="#" onclick="fncAddWriter()" style="color:blue;">[추가]</a></th>
													<td>
															<table id="writerInfo" frame=void>
																<tr>
																	<td><input type="text" class="writer" name="th_writers[0].th_stu_no" placeholder="학번"></td>
																	<td><input type="text" class="writer" name="th_writers[0].th_stu_name" placeholder="이름"></td>
																	<td style="width:15%;"></td>
																</tr>
															</table>
													</td>
														
												</tr>
												<tr>
													<th>논문 기록</th>
													<td>
														<input type="text" name="th_page" id="member" class="form-control" placeholder="기록된 논문 페이지"/>
													</td>
													<th>출판 날짜</th>
													<td>
														<input type="date" name="th_public_date" id="date" class="form-control" value=""/>
													</td>
												</tr>
												
		
											</tbody>
										</table>
										
										<!-- 버튼 -->
										<div class="button_rtbox">
											<span class="button bt01"><button type="submit" class="bt01">등록</button></span>
											<span class="button bt02"><button class="bt01" onclick="window.close()">닫기</button></span>
										</div>
									</form>
									
</div></div>

</body>


<script src="http://code.jquery.com/jquery.js"></script>
