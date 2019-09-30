<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page session="true" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../resources/css/board/common.css">
<link rel="stylesheet" href="../resources/css/board/default.css">
<link rel="stylesheet" href="../resources/css/board/content.css">
<link rel="stylesheet" href="../resources/css/project/pro_write.css">
<script src="http://code.jquery.com/jquery.js"></script>

<div class="pop_wrap" id="popUpLayerId">
	<div class="pop_tit">
		<span>등록하기</span>
	</div>
	<div class="pop_content">
		<form action="/pro_register.do" method="post" enctype = "multipart/form-data">
			
			<table class="pop_table">
				<tbody>
					<colgroup>
						<col width="150px">
						<col width="*">
					</colgroup>
					<tr>
						<th>분   류</th>
						<td>Project</td>
						<th>작성자</th>
						<td><input type="text" name="toc_writer"
							id="toc_writer" class="form-control" value="${sessionScope.userLoginInfo.stu_name}" readonly/>
							<input type="hidden" name="toc_writer_no" id="toc_writer_id" value="${sessionScope.userLoginInfo.stu_no }">
							
						</td>
					</tr>
					<tr>
						<th>작품명</th>
						<td colspan="3"><input type="text" style="width:520px;" placeholder="당신의 프로젝트명을 입력하세요." name="toc_title"
							id="toc_title" class="form-control"/></td>
					</tr>
					<tr>
						<th>설   명</th>
						<td colspan="3"><textarea name="toc_content" class="form-control" 
								placeholder="당신의 프로젝트에 대해 설명하세요."></textarea></td>
					</tr>
				</tbody>
			</table>
			<span>- 당신의 프로젝트를 대표하는 1개의 사진, 포트폴리오를 업로드 하세요. -</span>
			<br><br><a href="#this" class="btn" id="addFile">파일추가</a><br><br>
			<div id="fileDiv">
				<p> <input type="file" id="file" name="file_0">
				<a href="#this" class="btn" id="delete" name="delete"> 삭제</a> </p>
				
				<p> <input type="file" id="file" name="file_1">
				<a href="#this" class="btn" name="delete"> 삭제</a> </p>
			</div>
			
			

			
			<div class="button_rtbox">
				<span class="button bt01"><button type="submit" class="bt01">등록</button></span>
				<span class="button bt02"><button class="bt01"
						onclick="window.close()">닫기</button></span>
			</div>
		</form>
	</div>
</div>

<!-- In Content End -->







<script>
var gfv_count = 1;

	$(document).ready(function() {
						
		$("#addFile").on("click", function(e){ //파일 추가 버튼
            e.preventDefault();
            fn_addFile();
        });

		$("a[name='delete']").on("click", function(e){ //삭제 버튼
            e.preventDefault();
            fn_deleteFile($(this));
        });


	});
	
	function fn_addFile(){
        var str = "<p><input type='file' name='file_"+(gfv_count++)+"'><a href='#this' class='btn' name='delete'>삭제</a></p>";
        $("#fileDiv").append(str);
        $("a[name='delete']").on("click", function(e){ //삭제 버튼
            e.preventDefault();
            fn_deleteFile($(this));
        });
    }
     
    function fn_deleteFile(obj){
        obj.parent().remove();
    }
</script>

