<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.PrintWriter"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../resources/css/board/common.css">
<link rel="stylesheet" href="../resources/css/board/default.css">
<link rel="stylesheet" href="../resources/css/board/content.css">
<script src="http://code.jquery.com/jquery.js"></script>
<script>
var today = new Date();


</script>

<div class="pop_wrap" id="popUpLayerId">
	<div class="pop_tit">
		<span>링크 등록하기</span>
	</div>
	<div class="pop_content">
		<form action="/us_register.do" method="post">
			<input type="hidden" name="us_date" value="">
			<table class="pop_table">
				<tbody>
				<colgroup>
					<col width="150px">
					<col width="*">
				</colgroup>
				
				<tr>
					<th colspan="4">- Let share that you think useful source. -</th>
				</tr>
				<tr>
					<th>작성자</th>
					<td colspan="3"><input type="text" name="us_writer"
						id="toc_writer" class="form-control" style="width:520px;"/></td>
				</tr>

				<tr>
					<th>제목</th>
					<td colspan="3"><input type="text" name="us_title" style="width:520px;" placeholder="당신이 공유할 자료는 어떤 것 이나요." 
						id="toc_title" class="form-control"/></td>
				</tr>

			

				<tr>
					<th>링크</th>
					<td colspan="3"><textarea name="us_link" class="form-control" 
							placeholder="자유롭게 유용한 자료의 링크 주소를 공유하세요. "></textarea></td>
				</tr>
				</tbody>
			</table>
			
			<div class="button_rtbox">
				<span class="button bt01"><button type="submit" class="bt01">등록</button></span>
				<span class="button bt02"><button class="bt01"
						onclick="window.close()">닫기</button></span>
			</div>
		</form>
	</div>
</div>

<!-- In Content End -->
