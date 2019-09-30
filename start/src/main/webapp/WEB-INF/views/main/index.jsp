<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="utf-8" />
<jsp:include page="/WEB-INF/views/include/home.jsp" flush="true" />
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="true" />
<link rel="stylesheet" href="../resources/css/main/main_index.css">

<html>
<body>
<div id="main" class="container-fluid">
	<div class="row">
		<!--Start Content-->
		<div id="content" class="col-xs-12 col-sm-12">
			<div id="ajax-content">
				<div class="parallax-content baner-content" id="home">
					<div class="container">
						<div class="row">
							
							
							<!-- introduce -->
							<span>
								<h1>MOJUK</h1>
								<h4>- Wellcome. Introduce the <span class="text_mojuk">MOJUK</span> -</h4>
								
								<p>인하공업전문대학 컴퓨터정보학과 소속 전공동아리입니다.<br>우리 동아리 부원들 간의 소통과 상호관계를 통하여 서로에게 도움을 주고, 
									선후배관계를 넘어 친분과 우정이 품어 있습니다.</p>
								<p>4차혁명 IT산업시대에 맞추어 창의적이고 다양한 웹 프로그램을 개발<br>
									HTML/CSS, JS, JAVA, JSP등 다양한 언어를 활용해 웹 프로그램 개발에 있어 폭넓은 경험을 합니다.<br><br></p>
							</span>
							
							<!-- link_site -->
							<hr>
							<div class="link_site_zone">
								<a href="https://cms.itc.ac.kr" target="_blank" title="인하공업전문대학 홈페이지로 넘어갑니다.">
									<div class="link_site_content">
										<img src="../resources/images/inha.jpg" class="link_imge">
										<p>인하공업전문대학</p><p>https://cms.itc.ac.kr</p>
									</div>
								</a>
								<a href="https://cms.itc.ac.kr/site/cs" target="_blank" title="컴퓨터정보과 홈페이지로 넘어갑니다.">
									<div class="link_site_content">
										<img src="../resources/images/dept.png" class="link_imge">
											<p>컴퓨터정보과</p><p>https://cms.itc.ac.kr/site/cs</p>
									</div>
								</a>
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