<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false" %>

<jsp:include page="/WEB-INF/views/include/home.jsp" flush="true" />
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="true" />


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>profile</title>
<link rel="stylesheet" href="../resources/css/profile/profile.css">
</head>

<script>

function fnShowProfile(pfYear){

	if(pfYear == "2018pf"){
		document.getElementById("2019pf1").style.display="none";
		document.getElementById("2019pf2").style.display="none";
		document.getElementById("2018pf1").style.display="block";
		document.getElementById("2018pf2").style.display="block";
	}else{
		document.getElementById("2018pf1").style.display="none";
		document.getElementById("2018pf2").style.display="none";
		document.getElementById("2019pf1").style.display="block";
		document.getElementById("2019pf2").style.display="block";
	}
}
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
							
							
							
							<h1>Profile</h1>
							<h4>- We are the MOJUK. 2019 -</h4>
							<a href="#this" onclick="fnShowProfile('2018pf');">2018 년</a>&nbsp;&nbsp;|&nbsp;&nbsp;
							<a href="#this" onclick="fnShowProfile('2019pf');">2019 년</a>&nbsp;&nbsp;|&nbsp;&nbsp;
							<a href="/pf_member.do">동아리 부원 프로필</a>
							
							<div id="img_wrap">
								
									<img src="../resources/images/2019pf_1.png" class="img" id="2019pf1" >
									<img src="../resources/images/2019pf_2.png" class="img" id="2019pf2" >
								
							 
									<img src="../resources/images/2018pf_1.png" class="img" id="2018pf1" style="display:none;">
									<img src="../resources/images/2018pf_2.png" class="img" id="2018pf2" style="display:none;">	
								
							</div>
								
	</div></div></div></div></div></div></div>
</body>
</html>
<jsp:include page="/WEB-INF/views/include/footer.jsp" flush="true" />