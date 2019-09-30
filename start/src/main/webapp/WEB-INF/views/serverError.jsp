<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/include/home.jsp" flush="true" />
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="true" />
<link rel="stylesheet" href="../resources/css/loginAndJoin.css">
<meta charset="utf-8">
<title>MOJUK Server Error</title>
</head>

<script src="http://code.jquery.com/jquery.js"></script>
<script>

</script>

<body>
<div id="main" class="container-fluid">
	<div class="row">
		<!--Start Content-->
		<div id="content" class="col-xs-12 col-sm-12">
			<div id="ajax-content">
				<div class="parallax-content baner-content" id="home">
					<div class="container">
						<div id="login-page" class="row">
						  <div class="col s12 z-depth-4 card-panel">
						  
						    <form name="loginForm" action="/loginUp.do" class="login-form" method="post">
						    
						      <div class="row">
						        <div class="input-field col s12 center">
						          <h1 style="color:red;">
						          	Raise ERROR !!
						          </h1>
						        </div>
						      </div>
						      
						      <div id="login_join_wrap">
						      	<p><br><br>예상치 못한 에러가 발생하였습니다.</p>
						      	<p><c:out value="${msg}"/></p>
						      	<p>에러 해결을 위해 홈페이지 관리자에게 연락 바랍니다.</p>
						      	<p><br><i class="fa fa-envelope"></i>&nbsp;&nbsp;kimyeji203@naver.com</p>
						      	<p><i class="fa fa-phone"></i>&nbsp;&nbsp;010-5251-2771</p>
						      	<p>연락 가능시간 09:00 ~ 18:00 </p>

						      	
						      	<br><br><h3 style="color:red;">에러 사항</h3>
						      </div>
						
						
						    </form>
						  </div>
						</div>
</div></div></div></div></div></div>
</body>
</html>
<jsp:include page="/WEB-INF/views/include/footer.jsp" flush="true" />