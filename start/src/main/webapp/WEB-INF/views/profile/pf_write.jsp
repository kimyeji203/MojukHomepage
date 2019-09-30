<%@ page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../resources/css/board/common.css">
<link rel="stylesheet" href="../resources/css/board/default.css">
<link rel="stylesheet" href="../resources/css/board/content.css">
<link rel="stylesheet" href="../resources/css/profile/pf_write.css">
<title>Insert title here</title>
</head>

<script src="http://code.jquery.com/jquery.js"></script>
<script>

var count = ${fn:length(cntEdu)};
var count_ac = ${fn:length(cntAc)};



$(document).ready(function() {
	
	$("#addEdu").on("click", function(e){ 
        e.preventDefault();
        fnAddEdu();
    });
	$("#addAC").on("click", function(e){ 
        e.preventDefault();
        fnAddAC();
    });
    $("#updateImg").on("click", function(e){
		e.preventDefault();
		fnImgDiv();
    });

});

function fnImgDiv(){
	var str="<div><input type='file' id='input_img' name='pf_img' class='form-control'/><a href='#this' name='delete'>삭제</a></div>";
	$("#imgFileDiv").append(str);
    $("a[name='delete']").on("click", function(e){ //삭제 버튼
        e.preventDefault();
        fnDel2($(this));
    	$("#profileImg").attr("src","data:image/png;base64,${myProfile.myImg}");
    });
    $("#input_img").on("change",handleImgFileSelect);
    
}

function handleImgFileSelect(e){
	var files = e.target.files;
	var fileArr = Array.prototype.slice.call(files);

	fileArr.forEach(function(f){
		if(!f.type.match("image.*")){
			alert("확장자는 이미지 확장자만 가능합니다.");
			$("#input_img").val("");
			return;
		}

		sel_file = f;

		var reader = new FileReader();
		reader.onload = function(e){
			$("#profileImg").attr("src",e.target.result);
		}
		reader.readAsDataURL(f);
	});
}

function fnAddEdu(){
	var str = "<tr><td><input type='text' name='edu["+ (count) +"].university' class='form-control'></td><td><input class='form-control' type='text' name='edu["+(count++)+ "].depart'></td><td><a href='#this' name='delete'>삭제</a></td></tr>";
    $("#tableEdu").append(str);
    $("a[name='delete']").on("click", function(e){ //삭제 버튼
        e.preventDefault();
        fnDel($(this));
    });
}

function fnAddAC(){
	var str = "<tr>"+
	"<td><select name='ac["+(count_ac)+"].type' class='form-control' style='width:100%;'>"+
	"<option value='' selected='selected'>선택</option>"+
	"<option value='award'>수상</option>"+
	"<option value='certificate'>자격증</option>"+
	"</select></td>"+
	"<td><input type='text' name='ac["+(count_ac)+"].name' class='form-control'></td>"+
	"<td><input type='text' name='ac["+(count_ac)+"].host' class='form-control'></td>"+
	"<td><input type='date' name='ac["+(count_ac++)+"].date' value='' class='form-control'></td>"+
	"<td><a href='#this' name='delete'>삭제</a></td></tr>";
	
	$("#tableAC").append(str);
	$("a[name='delete']").on("click", function(e){ //삭제 버튼
        e.preventDefault();
        fnDel($(this));
    });
}

function fnDel(obj){
    obj.parent().parent().remove();
}
function fnDel2(obj){
	obj.parent().remove();
	
}


</script>
<div class="pop_wrap" id="popUpLayerId">
	<div class="pop_tit">
		<span>등록하기</span>
	</div>
	<div class="pop_content">
		<form action="/pf_register.do" enctype="multipart/form-data" method="post">
			<table class="pop_table">
			
			<c:choose>
				<c:when test="${myProfile eq 'null' }">
					<tr>
						<td class="tdTitle">이름</td>
						<td><input type="text" readonly name="pf_stu_name" class="form-control" value="${sessionScope.userLoginInfo.stu_name }"></td>
					</tr>
					<tr>
						<td class="tdTitle">학번</td>
						<td><input type="text" readonly name="pf_stu_no" class="form-control" value="${sessionScope.userLoginInfo.stu_no }"></td>
					</tr>
					<tr>
						<td class="tdTitle">생일</td>
						<td><input type="date" name="pf_stu_birthday" value="" class="form-control"></td>
					</tr>
					<tr>
						<td class="tdTitle">e-mail</td>
						<td><input type="text" name="pf_stu_email" class="form-control"></td>
					</tr>
				</c:when>
				<c:otherwise>
					<input type="hidden" name="pf_idx" value="${myProfile.myInfo.pf_idx }">
					<tr>
						<td class="tdTitle">이름</td>
						<td><input type="text" readonly name="pf_stu_name" class="form-control" value="${myProfile.myInfo.pf_stu_name }"></td>
					</tr>
					<tr>
						<td class="tdTitle">학번</td>
						<td><input type="text" readonly name="pf_stu_no" class="form-control" value="${myProfile.myInfo.pf_stu_no }"></td>
					</tr>
					<tr>
						<td class="tdTitle">생일</td>
						<td><input type="date" name="pf_stu_birthday" value="${myProfile.myInfo.pf_stu_birthday }" class="form-control"></td>
					</tr>
					<tr>
						<td class="tdTitle">e-mail</td>
						<td><input type="text" name="pf_stu_email" class="form-control" value="${myProfile.myInfo.pf_stu_email }"></td>
					</tr>
				</c:otherwise>
			</c:choose>
				
			</table>
			
			<br><span class="litleTitle">현재 학력 입력</span> &nbsp;&nbsp;&nbsp;&nbsp;<span class="button bt02"><button class="bt01" id="addEdu">추가</button></span><br>
			<table id="tableEdu" class="pop_table">
				<tr>
					<td class="tdTitle">학교 명</td>
					<td class="tdTitle">학과 명</td>
					<td></td>
				</tr>
				
				<c:choose>
					<c:when test="${myProfile eq 'null' }">
						<tr>
							<td><input type="text" name="edu[0].university" class="form-control"></td>
							<td><input type="text" name="edu[0].depart" class="form-control"></td>
							<td></td>
						</tr>
						
					</c:when>
					<c:otherwise>
						<c:forEach var="edu" items="${myProfile.myEdu }" varStatus="status">
							<tr>
								<td><input type="text" name="edu[${status.index }].university" class="form-control" value="${edu.university }"></td>
								<td><input type="text" name="edu[${status.index }].depart" class="form-control" value="${edu.university }"></td>
								<td><a href='#this' name='delete'>삭제</a></td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				
			</table>
			
			<!-- Award and Certificate -->
			<br><span class="litleTitle">수상 및 자격증 </span> &nbsp;&nbsp;&nbsp;&nbsp;<span class="button bt02"><button class="bt01" id="addAC">추가</button></span><br>
			<table id="tableAC" class="pop_table">
				<tr>
					<td class="tdTitle">분류</td>
					<td class="tdTitle">명칭</td>
					<td class="tdTitle">대회 및 기관</td>
					<td class="tdTitle">입상 및 취득 날짜</td>
					<td>  </td>
				</tr>
				<c:choose>
					<c:when test="${myProfile eq 'null' }">
							<tr>	
								<td>
									<select name="ac[0].type" class="form-control" style="width:100%;">
										<option value="" selected="selected">선택</option>
										<option value="award">수상</option>
										<option value="certificate">자격증</option>
									</select>
								</td>
								<td><input type="text" name="ac[0].name" class="form-control"></td>
								<td><input type="text" name="ac[0].host" class="form-control"></td>
								<td><input type="date" name="ac[0].date" class="form-control" value=""></td>
								<td></td>
							</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="ac" items="${myProfile.myAc }" varStatus="status">
							<tr>	
								<td>
									<select name="ac[${status.index }].type" class="form-control" style="width:100%;">
										<option value="">선택</option>
										
										<c:choose>
											<c:when test="${ac.type eq 'award' }">
												<option value="award" selected="selected">수상</option>
												<option value="certificate">자격증</option>
											</c:when>
											<c:otherwise>
												<option value="award">수상</option>
												<option value="certificate" selected="selected">자격증</option>
											</c:otherwise>
										</c:choose>
										
									</select>
								</td>
								<td><input type="text" name="ac[${status.index }].name" class="form-control" value="${ac.name }"></td>
								<td><input type="text" name="ac[${status.index }].host" class="form-control" value="${ac.host }"></td>
								<td><input type="date" name="ac[${status.index }].date" class="form-control" value="${ac.date }"></td>
								<td><a href="#this" name="delete">삭제</a></td>
							</tr>
						
						</c:forEach>	
					</c:otherwise>
				</c:choose>
				
				
			</table>
			
			<div id="imgFileDiv">
				<c:choose>
					<c:when test="${myProfile eq 'null' }">
						<input type="file" name="pf_img" class="form-control"/>
					</c:when>
					<c:otherwise>
						<br><span class="litleTitle">등록 된 이미지</span> &nbsp;&nbsp;&nbsp;&nbsp;
						<span class="button bt02"><button class="bt01" id="updateImg">이미지 수정</button></span><br>
						<img src="data:image/png;base64,${myProfile.myImg}" id="profileImg">

					</c:otherwise>
				</c:choose>
			</div>
			
			<div class="button_rtbox">
				<span class="button bt01"><input type="submit" class="bt01" value="저장"></span>
				<span class="button bt02"><button class="bt01" onclick="window.close()">닫기</button></span>
			</div>
		</form>
</div></div>
</body>
</html>