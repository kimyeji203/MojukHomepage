<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false" %>
<jsp:include page="/WEB-INF/views/include/home.jsp" flush="true" />
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="true" />

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/ganda/ga_list.css">
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>

<script src="http://code.jquery.com/jquery.js"></script>
<script>
$(document).ready(function(){
	$('#one').click(function(){
		$("#one_a").slideToggle();
	});
	$('#two').click(function(){
		$("#two_a").slideToggle();
	});
	$('#three').click(function(){
		$("#three_a").slideToggle();
	});
	$('#four').click(function(){
		$("#four_a").slideToggle();
	});
});
	

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
						
							<h1>Q & A</h1>
							<h4>- What is your question? Fine the answer in here.-</h4>
							<div id="ga_list_wrap">
								<div id="one" class="question">모죽 동아리 부원 모집 시기는 언제인가요?</div>
								<div id="one_a" class="answer">정식 모집 시기는 학과일정에 따라 변동됩니다.<br>모집시기는 학과 측에서 공식적으로 정해집니다.
									<br><br>그러나 모죽은 배움과 자기발전에 대해 열정을 가지고 있는 분에게 항상 열려 있습니다.
									<br>모죽 부원이 되고자 하시는 분은 담당교수님 혹은 모죽 회장님과의 면담을 추천드립니다.
								</div>
							
								<div id="two" class="question">3-in 활동이란?</div>
								<div id="two_a" class="answer">3-in 활동은 교수학습지원센터에서 실시하는 NCS기반의 전문직업인력 양성 프로그램 입니다.
									<br><br>학생 3대 핵심역량에 따라 1-in, 2-in, 3-in으로 총 3단계 수행을 요구합니다.
									<br>1-in은 학습동기부여과정으로 학습유형 진단 & 특강 2회 이상 참여 시 인증됩니다.
									<br>2-in은 개별학습활동 과정으로 POM나는 경진대회 or SOC들어오는 노트 공모전 or WOW캠프 참여 시 인증됩니다.
									<br>3-in은 공동체 학습 전용 과정으로 TOC튀는 멘토링 or FLY 튜터링 활동 시 인증됩니다.
									<br>위 세단계를 모두 인증 시 3-in 인증을 받습니다. 3-in 인증을 완수 시 교내 장학금과 마일리지가 주어집니다. (마일리지는 추후 장학금으로 되돌아옵니다.)
									<br><br>모죽은 TOC튀는 멘토링과 FLY 튜터링을 통하여 개인 또는 단체 간의 프로젝트를 수행하고, 개별 발전과 공동체에서의 협동심을 기릅니다.
									<br>자세한 사항은 학교 홈페이지를 참고하시기 바랍니다.
								</div>
								
								<div id="three" class="question">모죽에서의 개발 및 학습 과정은 어떤 방식인가요?</div>
								<div id="three_a" class="answer">저희 모죽은 자기주도학습 방식을 선호합니다.
									<br><br>교수님 혹은 선배로 부터의 강의식은 가르치는 사람의 방식에 맞게 다듬어진 정보의 습득을 요하는 방식이라고 볼 수 있습니다.
									<br>모죽은 강의식 학습 보다 자기주도학습 방식을 요구합니다.
									<br>스스로 구글링을 통하여 학습하고 시도하며, 다양한 오류와 해결을 통한 경험으로 큰 습득과 자신만의 정보를 만들 수 있습니다.
									
									<br><br>개인의 직접적인 경험과 성취감을 통하여 이뤄 낸다면 보다 값진 과정과 결과가 될 것 입니다.
									<br>더불어 선배들과의 자유분방한 소통과 적절한 상호작용을 통하여 배움에 있어 크고 작은 도움을 얻을 수 있습니다.
								</div>
								
							</div>			
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>
<jsp:include page="/WEB-INF/views/include/footer.jsp" flush="true" />