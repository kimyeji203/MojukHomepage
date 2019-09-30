<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900"
	rel="stylesheet">

<link rel="apple-touch-icon" href="apple-touch-icon.png">

<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/bootstrap-theme.min.css">
<link rel="stylesheet" href="../css/fontAwesome.css">
<link rel="stylesheet" href="../css/hero-slider.css">
<link rel="stylesheet" href="../css/owl-carousel.css">
<link rel="stylesheet" href="../css/templatemo-style.css">
<link rel="stylesheet" href="../css/lightbox.css">
<!-- main css, font, js -->


<jsp:include page="/WEB-INF/views/include/home.jsp" flush="true" />
<!-- html,jsp선언문,jstl선언문이 담겨있는 home -->
<%-- <jsp:include page="/WEB-INF/views/includes/header.jsp" flush="true" />
 --%>

<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<!--Start Container-->
<div id="main" class="container-fluid">
	<div class="row">
		<div id="sidebar-left" class="col-xs-2 col-sm-2">
			<ul class="nav main-menu">
			<c:set var="classification"
			value="${sessionScope.LOGIN_CLASSIFICATION}" />
		<c:if test="${classification eq 'IT기자재지원실'}">
		<li>
					<a href="/board" class="active ajax-link">
						<i class="fa fa-dashboard"></i>
						<span class="hidden-xs">IT기자재지원실 게시판</span>
					</a>
				</li>
		</c:if>
		<c:if test="${classification eq 'PC지원실1'}">
			<li>
					<a href="/board" class="active ajax-link">
						<i class="fa fa-dashboard"></i>
						<span class="hidden-xs">PC지원실1 게시판</span>
					</a>
				</li>
		</c:if>
		<c:if test="${classification eq 'PC지원실2'}">
			<li>
					<a href="/board" class="active ajax-link">
						<i class="fa fa-dashboard"></i>
						<span class="hidden-xs">PC지원실2 게시판</span>
					</a>
				</li>
		</c:if>
		<c:if test="${classification eq '네비게이션'}">
			<li>
					<a href="/board" class="active ajax-link">
						<i class="fa fa-dashboard"></i>
						<span class="hidden-xs">네비게이션 게시판</span>
					</a>
				</li>
		</c:if>
				
				<li class="dropdown">
					<a href="#" class="dropdown-toggle">
						<i class="fa fa-bar-chart-o"></i>
						<span class="hidden-xs">Charts</span>
					</a>
					<ul class="dropdown-menu">
						<li><a class="ajax-link" href="ajax/charts_xcharts.html">xCharts</a></li>
						<li><a class="ajax-link" href="ajax/charts_flot.html">Flot Charts</a></li>
						<li><a class="ajax-link" href="ajax/charts_google.html">Google Charts</a></li>
						<li><a class="ajax-link" href="ajax/charts_morris.html">Morris Charts</a></li>
						<li><a class="ajax-link" href="ajax/charts_coindesk.html">CoinDesk realtime</a></li>
					</ul>
				</li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle">
						<i class="fa fa-table"></i>
						 <span class="hidden-xs">Tables</span>
					</a>
					<ul class="dropdown-menu">
						<li><a class="ajax-link" href="ajax/tables_simple.html">Simple Tables</a></li>
						<li><a class="ajax-link" href="ajax/tables_datatables.html">Data Tables</a></li>
						<li><a class="ajax-link" href="ajax/tables_beauty.html">Beauty Tables</a></li>
					</ul>
				</li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle">
						<i class="fa fa-pencil-square-o"></i>
						 <span class="hidden-xs">Forms</span>
					</a>
					<ul class="dropdown-menu">
						<li><a class="ajax-link" href="ajax/forms_elements.html">Elements</a></li>
						<li><a class="ajax-link" href="ajax/forms_layouts.html">Layouts</a></li>
						<li><a class="ajax-link" href="ajax/forms_file_uploader.html">File Uploader</a></li>
					</ul>
				</li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle">
						<i class="fa fa-desktop"></i>
						 <span class="hidden-xs">UI Elements</span>
					</a>
					<ul class="dropdown-menu">
						<li><a class="ajax-link" href="ajax/ui_grid.html">Grid</a></li>
						<li><a class="ajax-link" href="ajax/ui_buttons.html">Buttons</a></li>
						<li><a class="ajax-link" href="ajax/ui_progressbars.html">Progress Bars</a></li>
						<li><a class="ajax-link" href="ajax/ui_jquery-ui.html">Jquery UI</a></li>
						<li><a class="ajax-link" href="ajax/ui_icons.html">Icons</a></li>
					</ul>
				</li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle">
						<i class="fa fa-list"></i>
						 <span class="hidden-xs">Pages</span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="ajax/page_login.html">Login</a></li>
						<li><a href="ajax/page_register.html">Register</a></li>
						<li><a id="locked-screen" class="submenu" href="ajax/page_locked.html">Locked Screen</a></li>
						<li><a class="ajax-link" href="ajax/page_contacts.html">Contacts</a></li>
						<li><a class="ajax-link" href="ajax/page_feed.html">Feed</a></li>
						<li><a class="ajax-link add-full" href="ajax/page_messages.html">Messages</a></li>
						<li><a class="ajax-link" href="ajax/page_pricing.html">Pricing</a></li>
						<li><a class="ajax-link" href="ajax/page_invoice.html">Invoice</a></li>
						<li><a class="ajax-link" href="ajax/page_search.html">Search Results</a></li>
						<li><a class="ajax-link" href="ajax/page_404.html">Error 404</a></li>
						<li><a href="ajax/page_500.html">Error 500</a></li>
					</ul>
				</li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle">
						<i class="fa fa-map-marker"></i>
						<span class="hidden-xs">Maps</span>
					</a>
					<ul class="dropdown-menu">
						<li><a class="ajax-link" href="ajax/maps.html">OpenStreetMap</a></li>
						<li><a class="ajax-link" href="ajax/map_fullscreen.html">Fullscreen map</a></li>
					</ul>
				</li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle">
						<i class="fa fa-picture-o"></i>
						 <span class="hidden-xs">Gallery</span>
					</a>
					<ul class="dropdown-menu">
						<li><a class="ajax-link" href="ajax/gallery_simple.html">Simple Gallery</a></li>
						<li><a class="ajax-link" href="ajax/gallery_flickr.html">Flickr Gallery</a></li>
					</ul>
				</li>
				<li>
					 <a class="ajax-link" href="ajax/typography.html">
						 <i class="fa fa-font"></i>
						 <span class="hidden-xs">Typography</span>
					</a>
				</li>
				 <li>
					<a class="ajax-link" href="ajax/calendar.html">
						 <i class="fa fa-calendar"></i>
						 <span class="hidden-xs">Calendar</span>
					</a>
				 </li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle">
						<i class="fa fa-picture-o"></i>
						 <span class="hidden-xs">Multilevel menu</span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="#">First level menu</a></li>
						<li><a href="#">First level menu</a></li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle">
								<i class="fa fa-plus-square"></i>
								<span class="hidden-xs">Second level menu group</span>
							</a>
							<ul class="dropdown-menu">
								<li><a href="#">Second level menu</a></li>
								<li><a href="#">Second level menu</a></li>
								<li class="dropdown">
									<a href="#" class="dropdown-toggle">
										<i class="fa fa-plus-square"></i>
										<span class="hidden-xs">Three level menu group</span>
									</a>
									<ul class="dropdown-menu">
										<li><a href="#">Three level menu</a></li>
										<li><a href="#">Three level menu</a></li>
										<li class="dropdown">
											<a href="#" class="dropdown-toggle">
												<i class="fa fa-plus-square"></i>
												<span class="hidden-xs">Four level menu group</span>
											</a>
											<ul class="dropdown-menu">
												<li><a href="#">Four level menu</a></li>
												<li><a href="#">Four level menu</a></li>
												<li class="dropdown">
													<a href="#" class="dropdown-toggle">
														<i class="fa fa-plus-square"></i>
														<span class="hidden-xs">Five level menu group</span>
													</a>
													<ul class="dropdown-menu">
														<li><a href="#">Five level menu</a></li>
														<li><a href="#">Five level menu</a></li>
														<li class="dropdown">
															<a href="#" class="dropdown-toggle">
																<i class="fa fa-plus-square"></i>
																<span class="hidden-xs">Six level menu group</span>
															</a>
															<ul class="dropdown-menu">
																<li><a href="#">Six level menu</a></li>
																<li><a href="#">Six level menu</a></li>
															</ul>
														</li>
													</ul>
												</li>
											</ul>
										</li>
										<li><a href="#">Three level menu</a></li>
									</ul>
								</li>
							</ul>
						</li>
					</ul>
				</li>
			</ul>
		</div>
		<!--Start Content-->
		<div id="content" class="col-xs-12 col-sm-10">
			<div class="preloader">
				<img src="img/devoops_getdata.gif" class="devoops-getdata" alt="preloader"/>
			</div>
			<div id="ajax-content">
			
		    <!-- Content IN START -->
			<div class="containers">
	<div class="row">

		<form role="form" method="post">
			<div class="box-body">

				<div class="form-group">
					<label for="exampleInputEmail1">분류</label> <input type="text"
						name="classification" class="form-control" value="${boardVO.classification}"
						readonly="readonly">
				</div>

				<div class="form-group">
					<label for="exampleInputEmail1">전화번호</label> <input type="text"
						name="number" class="form-control" value="${boardVO.number}"
						readonly="readonly">
				</div>

				<div class="form-group">
					<label for="exampleInputPassword1">소속</label>
					<textarea class="form-control" name="content" rows="3">	</textarea>
				</div>

				<div class="form-group">
					<label for="exampleInputEnail1">Writer</label> <input type="text"
						name="writer" class="form-control" value="${boardVO.writer}"
						readonly="readonly">
				</div>
			</div>
		</form>

		<div class="box-footer">
			<button type="submit" class="btn btn-primary">Save</button>
			<button type="submit" class="btn btn-warning">Cancel</button>
		</div>
	</div>
</div>
<!-- In Content End -->
			</div>
		</div>
		<!--End Content-->
	</div>
</div>
<!--End Container-->







<script>
	$(document).ready(function() {

		var formObj = $("form[role='form']");
		console.log(formObj);

		$(".btn-warning").on("click", function() {
			self.location = "/board/list";
		});

		$(".btn-primary").on("click", function() {
			formObj.submit();
		});
	});
</script>


