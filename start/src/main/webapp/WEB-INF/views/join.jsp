<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/include/home.jsp" flush="true" />
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="true" />
<link rel="stylesheet" href="../resources/css/loginAndJoin.css">
<meta charset="utf-8">
<title>Insert title here</title>
</head>

<script src="http://code.jquery.com/jquery.js"></script>
<script>
var checkPW = false;

function fn_input_control(){
	if(fn_check_void()){
		alert("회원가입 되었습니다.");
		document.joinForm.submit();
	}
}

function fn_check_void(){
	//미입력 제어
	if($("#stu_no").val().trim() == ""){
		alert("학번을 입력해 주세요");
		$("#stu_no").focus();
		return false;
	}else if($("#password").val().trim() == ""){
		alert("비밀번호를 입력해 주세요");
		$("#password").focus();
		return false;
	}else if($("#password_check").val().trim() == ""){
		alert("비밀번호 확인 란을 입력해 주세요");
		$("#password_check").focus();
		return false;
	}else if($("#stu_name").val().trim() == ""){
		alert("이름을 입력해 주세요");
		$("#stu_name").focus();
		return false;
	}else if($("#stu_dept").val().trim() == ""){
		alert("학과를 입력해 주세요");
		$("#stu_dept").focus();
		return false;
	}else if($("#email").val().trim() == ""){
		alert("이메일을 입력 해 주세요");
		$("#email").focus();
		return false;
	}else if($("#password_q").val().trim() == ""){
		alert("비밀번호 질문 란을 자유롭게 작성해 주세요");
		$("#password_q").focus();
		return false;
	}else if($("#password_a").val().trim() == ""){
		alert("비밀번호 답변 란을 자유롭게 작성해 주세요");
		$("#password_a").focus();
		return false;
	}
	
	//비밀번호 확인
	if(!fn_pw_check()){
		alert("비밀번호가 일치하지 않습니다.");
		$("#password_check").focus();
		return false;
	}
	

	return true;
}

function fn_pw_check(){
	if(checkPW){
		return true;
	}else{
		return false;
	}
}


$(function(){
	$("#password, #password_check").change(function() {
	   	var pw = $("#password").val().trim();
	   	var pw_c = $("#password_check").val().trim();
	   	if(pw != pw_c){
	   		var str="<span id='gide_pw_content' style='color:red;'>비밀번호 불일치</span>";
	   		$("#gide_pw_content").remove();
	   		$("#gide_pw").append(str);
	   		checkPW = false;
		}else{
			var str="<span id='gide_pw_content' style='color:blue;'>비밀번호 일치</span>";
			$("#gide_pw_content").remove();
			$("#gide_pw").append(str);
			checkPW = true;
		}
	});	
});

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
						  
						    <form name="joinForm" action="/joinUp.do" class="login-form" method="post">
						    
						      <div class="row">
						        <div class="input-field col s12 center">
						          <h1>Join</h1>
						          <h4>- Join to the 'MOJUK' now ! -</h4>
						        </div>
						      </div>
						      
								<div id="login_join_wrap" >
									<table id="join_table">
										<tr>
											<td>
												<label for="stu_no">학번</label>
											</td>
											<td>
												<input class="form-control" id="stu_no" name="stu_no" type="text"/>
											</td>
										</tr>
										<tr>
											<td>
												<label for="stu_name">이름</label>
											</td>
											<td>
												<input class="form-control" id="stu_name" name="stu_name" type="text"/>
									        </td>
										</tr>
										<tr>
											<td>
												<label for="stu_dept">학과</label>
											</td>
											<td>
												<input class="form-control" id="stu_dept" name="stu_dept" type="text" style="cursor: auto;" />
									        </td>
										</tr>
										<tr>
											<td>
												<label for="email">Email</label>
											</td>
											<td>
												<input class="form-control" id="email" name="email" type="text" style="cursor: auto;" />
									        </td>
										</tr>
										<tr>
											<td>
												<label for="password">Password</label><span id="gide_pw"><span id='gide_pw_content' style='color:red;'></span></span>
									        </td>
											<td>
												<input class="form-control" id="password" name="password" type="password" />
									         </td>
										</tr>
										<tr>
											<td>
												<label for="password_check">Password again</label>
									          
											</td>
											<td>
												<input class="form-control" id="password_check" name="cpassword" type="password" />
									          
											</td>
										</tr>
										<tr>
											<td>
												 <label for="password_check">PW find Q</label>
									         
											</td>
											<td>
											 <input class="form-control" id="password_q" name="pw_q" type="text" />
									          
											</td>
										</tr>
										<tr>
											<td><label for="password_a">PW find A</label>
									         </td>
									         <td> 
									         <input class="form-control" id="password_a" name="pw_a" type="text" />
									          </td>
										</tr>
									</table>
									  <div class="row_margin">
								        <input type="button" class="button bt01 ljbtn" id="join_table" onclick="fn_input_control()" value="회원가입">
										<div id="row_add_text">
											<p>이미 회원가입을 하셨나요?<a href="/login.do">로그인</a></p>
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