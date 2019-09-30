<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/include/home.jsp" flush="true" />
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="true" />
<link rel="stylesheet" href="../resources/css/loginAndJoin.css">
<meta charset="utf-8">
<title>MOJUK</title>
</head>

<script src="http://code.jquery.com/jquery.js"></script>
<script>
function fn_check_void(){
	var id = document.getElementById("stu_no");
	var pw = document.getElementById("password");

	if($("#stu_no").val().trim() == ""){
		alert("학번을 입력해 주세요");
		$("#stu_no").focus();
		return false;
	}
	else if($("#password").val().trim() == ""){
		alert("비밀번호를 입력해 주세요");
		$("#password").focus();
		return false;
	}else{
		return true;
	}
}

function fn_input_control(){
	if(fn_check_void()){
		document.loginForm.submit();
	}
}
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
						          <h1>Login</h1>
						        </div>
						      </div>
						      
						      <div id="login_join_wrap">
						      	<div id="inputForm">
								      <div class="row_margin">
								          <input id="stu_no" class="form-control" name="stu_no" type="text" placeholder="학번"/>
								        
								      </div>
								
									  <div class="row_margin">
								          <input id="password" class="form-control" name="password" type="password" placeholder="비밀번호"/>
								         
								      </div>
								      
									
								      <div class="row_margin">
								        <input type="button" class="button bt01 ljbtn" onclick="fn_input_control()" value="로그인">
										<div id="row_add_text">
											<p>회원이 아니신가요?<a href="/join.do">회원가입</a></p>
									        <p>비밀번호를 잊어 버리셨나요?<a href="#" onclick="fnc_popup();">찾기</a></p>
								      	</div>
								      </div>
						      	</div>
						      </div>
						
						
						    </form>
						  </div>
						</div>
</div></div></div></div></div></div>
</body>
</html>
<jsp:include page="/WEB-INF/views/include/footer.jsp" flush="true" />