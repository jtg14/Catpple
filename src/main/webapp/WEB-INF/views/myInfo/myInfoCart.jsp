<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="resources/custom/addCSS/myroom.css">
<link rel="stylesheet" href="resources/custom/addCSS/footer.css">
<link rel="stylesheet" href="resources/custom/addCSS/star-rating.css">
<link rel="stylesheet" href="resources/custom/addCSS/checkbox.css">
<link
	href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean"
	rel="stylesheet">
<title>장바구니 | Catpple</title>
<style>
@media ( max-width : 768px) {
	.first-div {
		border-top: 1px solid lightgray;
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
					href="#" data-original-title="Good"> <i
						class="fa fa-bar-chart-o"></i>
				</a></li>
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
					<div class="col-sm-12 col-md-12" id="content">
						<!-- 메인 내용 들어갈 공간 -->

						<div class="col-md-10 col-xs-12"
							style="padding-left: 0px; padding-right: 0px;">
							<h2 style="color: crimson">장바구니</h2>
							<c:forEach var="list" items="${list}" varStatus="vs">
								<div class="container text-center"
									style="border-top: 2px solid lightgray; padding-top: 10px; padding-bottom: 10px; padding-left: 0px; padding-right: 0px;">
									<div class="col-md-6 col-xs-12"
										style="padding-top: 0px; padding-bottom: 0px; padding-right: 0px; padding-left: 0px;">
										<div class="col-md-6 col-xs-4" style="padding-left: 0px;">
											<img class="img"
												src="resources/sellerInfo/${list.sellerID}/${list.gImg1}"
												style="width: 110px; hieght: 110px;" />
										</div>
											
										<div class="col-md-6 col-xs-8"
											style="padding-top: 4%; padding-right: 0px;">

											<h4 style="padding-left: 8px;">${list.gName}</h4>
											<label style="font-size: x-small;">재고 있음</label>
											<div class="checkbox">
												<label style="font-size: 2em"> <input name="box"
													type="checkbox" value="${list.cId}" checked>
													<span class="cr"><i class="cr-icon fa fa-check"></i></span>
													선택
												</label>
											</div>
										</div>


									</div>
									<div class="col-md-6 col-xs-12 first-div"
										style="padding-top: 5%;padding-left: 0px;padding-right: 0px;">
										<div class="col-md-3 col-xs-4">
											<span>${list.gPrice}원</span>
										</div>
										<div class="col-md-9 col-xs-8">
											<span>수량 <input class="form-group input-sm"
												type="number" value="${list.cAmount}"
												style="width: 60px; margin-bottom: 5px;"></span> <a
												class="btn btn-default pull-right" type="button"
												onclick="deleteCart('${list.cId}')">삭제</a>
										</div>
										<div class="col-md-3 col-md-offset-6 col-xs-4 col-xs-offset-6 text-center">
											<button id="amount"
												class="btn btn-primary btn-xs amount_modification">수 정</button>
										</div>
									</div>
								</div>
							</c:forEach>

						</div>
						<c:if test="${cartRow != 0}">
							<div class="col-md-2 col-md-offset-8 col-xs-4 col-xs-offset-4"
								style="margin-top: 20px;">
								<button type="button" class="btn btn-lg btn-danger"
					onclick="purchaseOnCart('${logInUser.mGrade}','${logInUser.mId}')">구매하기</button>
							</div>
						</c:if>
						<c:if test="${cartRow == 0}">
							<div class="col-md-4 col-md-offset-4 col-xs-12 "
								style="martin-top: 200px;">
								<img class="img" src="resources/images/No_Cart.png"
									style="width: 100%;">
							</div>
						</c:if>
					</div>
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->


	<script src="resources/bootstrap/js/jquery-3.2.1.min.js"></script>
	<script src="resources/bootstrap/js/bootstrap.js"></script>
	<script src="resources/custom/addJS/myroom.js"></script>
	<script src="resources/custom/addJS/minifunction.js"></script>
</body>
<footer>
	<div class="article">
		<jsp:include page="../footer.jsp" />
	</div>
</footer>
</html>