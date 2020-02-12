<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문조회 | Catpple</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="resources/custom/addCSS/myroom.css">
<link rel="stylesheet" href="resources/custom/addCSS/footer.css">
<link rel="stylesheet" href="resources/custom/addCSS/star-rating.css">
<link rel="stylesheet" href="resources/custom/addCSS/checkbox.css">
<link
	href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean"
	rel="stylesheet">
<style>
#first-row, #second-row {
	font-weight: bold;
	color: crimson;
}

@media ( min-width : 968px) {
	.img {
		width: 150px;
		margin-left: 50px;
	}
	.contentInfo {
		margin-top: 40px;
	}
}

@media ( max-width : 768px) {
	.img {
		width: 100%;
	}
}
</style>
</head>
<body class="font-Jua">
	<div id="throbber" style="display: none; min-height: 120px;"></div>
	<div id="noty-holder"></div>
	<div id="wrapper">
		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-ex1-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand logo"
					style="margin-top: 0px; padding-top: 0px;" href="home"> <img
					src="resources/images/CatppleLogo.png" style="width: 140px;">
				</a>
			</div>
			<!-- Top Menu Items -->
			<ul class="nav navbar-right top-nav">
				<li><a href="#" data-placement="bottom" data-toggle="tooltip"
					href="#" data-original-title="Good"></a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">나의메뉴 <b class="fa fa-angle-down"></b></a>
					<ul class="dropdown-menu">
						<li><a href="mroom"><i class="fa fa-fw fa-user"></i>${logInUser.mName}
								님(마이룸)</a></li>
						<li class="divider"></li>
						<li><a href="logOut"><i class="fa fa-fw fa-power-off"></i>
								로그아웃</a></li>
					</ul></li>
			</ul>
			<!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
			<div class="collapse navbar-collapse navbar-ex1-collapse"
				style="max-height: 700px; background-color: white;">
				<ul class="nav navbar-nav side-nav" style="height: 90%;">
					<li><h3>
							<a href="#" data-toggle="collapse" data-target="#submenu-4"><i
								class="fa fa-fw fa-star"></i> 내정보 <i
								class="fa fa-fw fa-angle-down pull-right"></i></a>
						</h3>
						<ul id="submenu-4" class="collapse">
							<c:if test="${logInUser.mGrade!='S'}">
								<li><a href="mpoint"><i
										class="fa fa-angle-double-right"></i> 포인트</a></li>
							</c:if>
							<li><a href="mChangef"><i
									class="fa fa-angle-double-right"></i> 내정보변경</a></li>
							<li><a href="mWdrawal"><i
									class="fa fa-angle-double-right"></i> 회원탈퇴</a></li>
						</ul></li>
					<c:if test="${logInUser.mGrade!='S'}">
						<li><h3>
								<a href="#" data-toggle="collapse" data-target="#submenu-2"><i
									class="fa fa-fw fa-star"></i> 주문배송 <i
									class="fa fa-fw fa-angle-down pull-right"></i></a>
							</h3>
							<ul id="submenu-2" class="collapse">
								<li><a href="mODelivery"><i
										class="fa fa-angle-double-right"></i> 주문/배송조회</a></li>
								<li><a href="mOCancel"><i
										class="fa fa-angle-double-right"></i> 주문취소</a></li>
								<li><a href="mRExchange"><i
										class="fa fa-angle-double-right"></i> 반품/교환</a></li>
								<li><a href="mCart"><i class="fa fa-angle-double-right"></i>
										장바구니<span class="label label-danger">${cartRow}</span></a></li>
							</ul></li>
						<li><h3>
								<a href="#" data-toggle="collapse" data-target="#submenu-3"><i
									class="fa fa-fw fa-star"></i> 고객센터 <i
									class="fa fa-fw fa-angle-down pull-right"></i></a>
							</h3>
							<ul id="submenu-3" class="collapse">
								<li><a href="mCustomerInquiry"><i
										class="fa fa-angle-double-right"></i> 1:1문의</a></li>
								<li><a href="mFAQ"><i class="fa fa-angle-double-right"></i>
										FAQ</a></li>
								<li><a href="mSuggestions"><i
										class="fa fa-angle-double-right"></i> 건의사항</a></li>
								<li><a href="mWriting"><i
										class="fa fa-angle-double-right"></i> 글쓰기 (모든글)</a></li>
							</ul></li>
					</c:if>
					<c:if test="${logInUser.mGrade!='C'}">
						<li><h3>
								<a href="#" data-toggle="collapse" data-target="#submenu-5"><i
									class="fa fa-fw fa-star"></i> 판매자 메뉴 <i
									class="fa fa-fw fa-angle-down pull-right"></i></a>
							</h3>
							<ul id="submenu-5" class="collapse">
								<li><a href="sGForm"><i
										class="fa fa-angle-double-right"></i> 상품등록</a></li>
								<li><a href="sRGoods"><i
										class="fa fa-angle-double-right"></i> 나의 상품</a></li>
								<li><a href="sOList"><i
										class="fa fa-angle-double-right"></i> 주문목록</a></li>
							</ul></li>
					</c:if>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</nav>

		<div id="page-wrapper">
			<div class="container-fluid">
				<!-- Page Heading -->
				<div class="row" id="main"
					style="min-height: 1000px; margin-top: 120px;">
					<div class="col-md-6 col-xs-6">
						<span class="h2" id="opList">주문조회(${fn:length(oplist)})</span>
					</div>
					<div class="col-md-6 col-xs-6 text-center">
						<a class="btn btn-default btn-lg" style="margin-top: 20px;"
							onclick="javascript:history.back(1)">목록으로</a>
					</div>
					<div class="col-md-10 col-xs-12">
						<c:forEach var="oplist" items="${oplist}" varStatus="status">
							<div class="col-md-12 col-xs-12"
								style="border-top: 2px solid lightgray; margin-top: 20px;padding-right:0px;padding-left: 0px;">
								<div class="col-md-3 col-xs-12"
									style="padding-left: 0; padding-right: 0;">
									<img class="img"
										src="resources/sellerInfo/${oplist.member_mId}/${oplist.gImg1}">
								</div>
								<div class="col-md-9 col-xs-12 contentInfo">
									<div class="col-md-6 col-xs-12" style="padding-right: 0px;">
										<h3>${oplist.gName}</h3>
									</div>
									<div class="col-md-6 col-xs-12">
										<div class="col-md-6 col-xs-12 text-center">
											<h3>판매자:${oplist.member_mId}</h3>
											<h5 style="color: lightgray;">
												(<span id="addHyphen${status.index}">${oplist.mPhone}</span>)
											</h5>
										</div>
										<c:choose>
											<c:when test="${oplist.dState=='a'}">
												<div class="col-md-6 col-xs-12 text-center">
													<font style="color: crimson;"> 배송준비 중</font> <br>송장번호:
													${oplist.dNum}
												</div>
											</c:when>
											<c:when test="${oplist.dState=='b'}">
												<div class="col-md-6 col-xs-12 text-center">
													<font style="color: #FF8C00;">배송 중</font> <br>송장번호:
													${oplist.dNum}
												</div>
											</c:when>
											<c:when test="${oplist.dState=='c'}">
												<div class="col-md-6 col-xs-12 text-center">
													<font style="color: green;"> 배송 완료 </font> <br>송장번호:
													${oplist.dNum}
												</div>
											</c:when>
											<c:when test="${oplist.dState=='d'}">
												<div class="col-md-6 col-xs-12 text-center">
													<font style="color: green;"> 배송 취소 </font> <br>송장번호:
													${oplist.dNum}
												</div>
											</c:when>
										</c:choose>
									</div>
									<div class="col-md-12 col-xs-12 text-left">
										<div class="col-md-6 col-xs-12">
											<h4>
												결제 금액 :
												<fmt:formatNumber value="${oplist.midPrice}" pattern="#,###" />
												원
											</h4>
										</div>
										<c:choose>
											<c:when test="${oplist.dState=='a'}"><!-- 배송준비중 -->
												<c:if test="${oplist.oStatus eq 'os1'}"><!-- 주문취소 -->
													<div class="col-md-3 col-md-offset-3 col-xs-12 text-center">
														<button class="btn btn-danger disabled">취소완료</button>
													</div>
												</c:if>
												<c:if test="${oplist.oStatus eq 'os3'}"><!-- 주문완료 -->
													<div class="col-md-3 col-md-offset-3 col-xs-12 text-center">
														<button class="btn btn-danger" onclick="justReqeust(${oplist.oNum},'os4')">취소요청</button>
													</div>
												</c:if>
												<c:if test="${oplist.oStatus eq 'os4'}"><!-- 주문취소요청 -->
													<div class="col-md-3 col-md-offset-3 col-xs-12 text-center">
														<button class="btn btn-danger disabled">취소요청완료</button>
													</div>
												</c:if>
											</c:when>


											<c:when test="${oplist.dState=='b' || oplist.dState=='c'}"><!-- 배송중 or 배송완료 -->
													<c:if test="${oplist.oStatus ne 'os2'}"><!-- 반품완료 -->
														<div class="col-md-3 col-md-offset-3 col-xs-12 text-center">
															<button class="btn btn-success disabled">반품완료</button>
														</div>
													</c:if>
													<c:if test="${oplist.oStatus ne 'os3'}"><!-- 주문완료 -->
														<div class="col-md-3 col-md-offset-3 col-xs-12 text-center">
															<button class="btn btn-success" onclick="justReqeust(${oplist.oNum},'os5')">반품요청</button>
														</div>
													</c:if>
													<c:if test="${oplist.oStatus eq 'os5'}"><!-- 주문반품요청 -->
														<div class="col-md-3 col-md-offset-3 col-xs-12 text-center">
															<button class="btn btn-success disabled">반품요청완료</button>
														</div>
													</c:if>
											</c:when>
										</c:choose>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- /#page-wrapper -->
	<!-- #wrapper -->



	<script src="resources/bootstrap/js/jquery-3.2.1.min.js"></script>
	<script src="resources/custom/addJS/minifunction.js"></script>
	<script src="resources/bootstrap/js/bootstrap.js"></script>
	<script src="resources/custom/addJS/myroom.js"></script>
</body>

</html>