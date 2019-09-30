<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  

<link rel="stylesheet" href="../resources/css/board/common.css">
<link rel="stylesheet" href="../resources/css/board/default.css">
<link rel="stylesheet" href="../resources/css/board/content.css">
<script src="http://code.jquery.com/jquery.js"></script>
<script src="<c:url value='../resources/js/common.js'/>" charset="utf-8"></script>
<form id="commonForm" name="commonForm"></form>
<!--Start Content-->
<div class="pop_wrap" id="popUpLayerId">
	<div class="pop_tit">
		<span>게시판 상세보기</span>
	</div>
	<div class="pop_content">
		<table class="pop_table">
			<tbody>
			<colgroup>
				<col width="150px">
				<col width="*">
			</colgroup>
			<tbody>
				<tr>
					<th>분류</th>
					<td>Project</td>            
				</tr>


				<tr>
					<th>제목</th>
					<td><input type="text" name="content" class="form-control"
						value="${map.toc_title}" readonly /></td>
					
				<tr>
					<th>내용</th>
					<td><textarea name="content" class="form-control" readonly>${map.toc_content}</textarea></td>
				</tr>
				<tr>
					<th scope="row">첨부파일</th>
						<td>
	                        <div id="fileDiv">               
	                            <c:forEach var="row" items="${list}" varStatus="var">
	                                <p>
	                                    <input type="hidden" id="IDX" name="IDX_${var.index }" value="${row.IDX }">
	                                    <a href="#this" name="file">${row.ORIGINAL_FILE_NAME }</a>          
	                                    (${row.FILE_SIZE }kb)
	                <%--                     <a href="#this" class="btn" id="delete_${var.index }" name="delete_${var.index }">삭제</a> --%>
	                                </p>
	                            </c:forEach>
	                        </div>
	                    </td>
				</tr>
			
			</tbody>
		</table>
		
		<div class="button_rtbox">
			<span class="button bt02"><button class="bt01"
					onclick="window.close()">닫기</button></span>
			
		</div>
	</div>

</div>
<script type="text/javascript">
		$(document).ready(function(){

			$("a[name='file']").on("click", function(e){ //파일 이름
				
				e.preventDefault();
				fn_downloadFile($(this));
			});
		});

		function fn_downloadFile(obj){
			var idx = obj.parent().find("#IDX").val();
			
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/common/downloadFile.do' />");
			comSubmit.addParam("IDX", idx);
			comSubmit.submit();
		}
	</script>