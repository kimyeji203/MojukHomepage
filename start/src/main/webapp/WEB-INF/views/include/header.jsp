<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true" %>
		
<!--Start Header-->
<div id="screensaver">
	<canvas id="canvas"></canvas>
	<i class="fa fa-lock" id="screen_unlock"></i>
</div>
<div id="modalbox">
	<div class="devoops-modal">
		<div class="devoops-modal-header">
			<div class="modal-header-name">
				<span>Basic table</span>
			</div>
			<div class="box-icons">
				<a class="close-link"> <i class="fa fa-times"></i>
				</a>
			</div>
		</div>
		<div class="devoops-modal-inner"></div>
		<div class="devoops-modal-bottom"></div>
	</div>
</div>
<header class="navbar">
	<div class="container-fluid expanded-panel">
		<div class="row">
			<div id="logo" class="col-xs-12 col-sm-2">
				<a href="/mainpage.do">MOJUK</a>
			</div>
			<div id="top-panel" class="col-xs-12 col-sm-10">
				<div class="row">
					<div class="col-xs-8 col-sm-9">
						<a href="/profile.do" class="dropdown-toggle">
							<i class="fa fa-pencil-square-o"></i> <span class="hidden-xs">프로필  </span>
						</a>
						
						<i >&nbsp; | &nbsp;</i>
						<a href="/pro_list.do" class="dropdown-toggle">
							<i class="fa fa-desktop"></i> <span class="hidden-xs">  프로젝트  </span>
						</a>
						<i >&nbsp; | &nbsp;</i>
						<a href="/participate.do" class="dropdown-toggle">
							<i class="fa fa-check"></i> <span class="hidden-xs">  참여현황  </span>
						</a>
						<i >&nbsp; | &nbsp;</i>
						<a href="/th_list.do" class="dropdown-toggle">
							<i class="fa fa-bookmark"></i> <span class="hidden-xs">  논문 발표  </span>
						</a>
						<i >&nbsp; | &nbsp;</i>
						<a href="/useful_link.do" class="dropdown-toggle">
							<i class="fa fa-share"></i> <span class="hidden-xs">  자료공유  </span>
						</a>
						<i >&nbsp; | &nbsp;</i>
						<a href="/gallery.do" class="dropdown-toggle">
							<i class="fa fa-picture-o"></i> <span class="hidden-xs">  갤러리</span>
						</a>
						
						<i >&nbsp; | &nbsp;</i>
						<a href="/ganda.do" class="dropdown-toggle">
							<i class="fa fa-quote-left"></i> <span class="hidden-xs">  Q & A</span>
						</a>
					</div>


						<div class="col-xs-4 col-sm-3 top-panel-right">
							<ul class="nav navbar-nav pull-right panel-menu">
								<li>
									<span>
									<c:choose>
										<c:when test="${not empty sessionScope.userLoginInfo }">
											${sessionScope.userLoginInfo.stu_no}&nbsp;${sessionScope.userLoginInfo.stu_name }
											
											<!-- &nbsp;<a href="/logout.do" onclick="#">로그아웃</a> -->
										</c:when>
										<c:otherwise>
											<a href="/login.do" onclick="#">로그인</a>&nbsp; | &nbsp;
											<a href="/join.do" onclick="#">회원가입</a>
										</c:otherwise>
									</c:choose>
									</span>
								</li>
								<li class="dropdown">
									<a href="#" class="dropdown-toggle account" data-toggle="dropdown">
										<div class="avatar">
											<img src="../resources/images/mojuk_logo.png" class="img-rounded" alt="avatar" style="margin:0;"/>
										</div> 
										<i class="fa fa-angle-down pull-right"></i>
										<!-- <div class="user-mini pull-right">						</div> -->
									</a>
									<ul class="dropdown-menu">
										<c:choose>
											<c:when test="${not empty sessionScope.userLoginInfo }">
												<li>
													<a href="/logout.do">
														<i class="fa fa-power-off"></i>
														<span class="hidden-sm text">Logout</span>
													</a>
												</li>
											</c:when>
											<c:otherwise>
												<li>
													<a href="/login.do">
														<i class="fa fa-power-off"></i>
														<span class="hidden-sm text">Login</span>
													</a>
												</li>
											</c:otherwise>
										</c:choose>
										
									</ul>
								</li>
							</ul>
						</div>

				</div>
			</div>
		</div>
	</div>
</header>






