<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.PrintWriter"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../resources/css/board/common.css">
<link rel="stylesheet" href="../resources/css/board/default.css">
<link rel="stylesheet" href="../resources/css/board/content.css">
<script src="http://code.jquery.com/jquery.js"></script>


<div class="pop_wrap" id="popUpLayerId">
	<div class="pop_tit">
		<span>등록하기</span>
	</div>
	<div class="pop_content">
		<form action="/toc_register.do" method="post" enctype = "multipart/form-data">
			<table class="pop_table">
				<tbody>
				<colgroup>
					<col width="150px">
					<col width="*">
				</colgroup>
				
				<tr>
					<th>분류</th>
					<td><select name="toc_belong">
							<option value="PPT" selected="selected">PPT</option>
							<option value="사진">사진</option>
							<option value="백업 및 결과물">백업 및 결과물</option>
					</select></td>
					<th>작성자</th>
					<td><input type="text" name="toc_writer"
						id="toc_writer" class="form-control"/></td>
				</tr>
				
				<!-- <tr>
					<th>파일선택</th>
					<td colspan="3"><input type="file"
						name="toc_file" id="toc_file" class="form-control" style="width:520px;"></td>
				
				</tr> -->
				<tr>
					<th>제목</th>
					<td colspan="3"><input type="text" style="width:520px;" placeholder="제목을 입력하세요." name="toc_title"
						id="toc_title" class="form-control"/></td>
				</tr>

			

				<tr>
					<th>내용</th>
					<td colspan="3"><textarea name="toc_content" class="form-control" 
							placeholder="내용을 입력하세요. "></textarea></td>
				</tr>
				</tbody>
			</table>
			<div id="fileDiv">
			<p> <input type="file" id="file" name="file_0">
				<a href="#this" class="btn" id="delete" name="delete"> 삭제</a> </p>
			</div>
			<br><br>
				<a href="#this" class="btn" id="addFile">파일추가</a> 

			
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

