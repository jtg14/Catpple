<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link  rel="stylesheet" href="resources/custom/addCSS/star-rating.css">
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="resources/custom/addCSS/myroom.css">
<link rel="stylesheet" href="resources/custom/addCSS/footer.css">
<link rel="stylesheet" href="resources/custom/addCSS/star-rating.css">
<link rel="stylesheet" href="resources/custom/addCSS/checkbox.css">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean"
	rel="stylesheet">
<title>myInfoExpectedPoints</title>
<style>
.item-size {
	border: 3px solid lightgray;
	border-radius: 10px;
}
th,td{
text-align:center;
}
@media (min-width: 968px) {
	  tbody{
	  	font-size:18px;
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
					data-target=".navbar-ex1-collapse" >
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand logo" style="margin-top: 5px;" href="home">
					<img alt="로고자리" src="...">
				</a>
			</div>
			<!-- Top Menu Items -->
			<ul class="nav navbar-right top-nav">
				<li><a href="#" data-placement="bottom" data-toggle="tooltip"
					href="#" data-original-title="Good"><i
						class="fa fa-bar-chart-o"></i> </a></li>
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
			<div class="collapse navbar-collapse navbar-ex1-collapse" style="max-height:700px;">
				<ul class="nav navbar-nav side-nav" style="height: 90%;">
					<li><h3>
							<a href="#" data-toggle="collapse" data-target="#submenu-1"
								aria-expended="true"><i class="fa fa-fw fa-search"></i>내지갑 <i
								class="fa fa-fw fa-angle-down pull-right"></i></a>
						</h3>
						<ul id="submenu-1" class="collapse">
							<li><a href="mpoint"><i
									class="fa fa-angle-double-right"></i> 포인트</a></li>
							<li><a href="mEPoint"><i
									class="fa fa-angle-double-right"></i> 적립 예정 포인트</a></li>
						</ul></li>
					<li><h3><a href="#" data-toggle="collapse"
						data-target="#submenu-2"><i class="fa fa-fw fa-star"></i>
							주문배송 <i class="fa fa-fw fa-angle-down pull-right"></i></a></h3>
						<ul id="submenu-2" class="collapse">
							<li><a href="mODelivery"><i
									class="fa fa-angle-double-right"></i> 주문/배송조회</a></li>
							<li><a href="mOCancel"><i
									class="fa fa-angle-double-right"></i> 주문취소</a></li>
							<li><a href="mRExchange"><i
									class="fa fa-angle-double-right"></i> 반품/교환</a></li>
							<li><a href="mCart"><i
									class="fa fa-angle-double-right"></i> 장바구니</a></li>
						</ul></li>
					<li><h3><a href="#" data-toggle="collapse"
						data-target="#submenu-3"><i class="fa fa-fw fa-star"></i>
							고객센터 <i class="fa fa-fw fa-angle-down pull-right"></i></a></h3>
						<ul id="submenu-3" class="collapse">
							<li><a href="mCustomerIquiry"><i
									class="fa fa-angle-double-right"></i> 1:1문의</a></li>
							<li><a href="mFAQ"><i
									class="fa fa-angle-double-right"></i> FAQ</a></li>
							<li><a href="mSuggestions"><i
									class="fa fa-angle-double-right"></i> 건의사항</a></li>
							<li><a href="mWriting"><i
									class="fa fa-angle-double-right"></i> 글쓰기 (모든글)</a></li>
						</ul></li>
					<li><h3><a href="#" data-toggle="collapse"
						data-target="#submenu-4"><i class="fa fa-fw fa-star"></i>
							내정보 <i class="fa fa-fw fa-angle-down pull-right"></i></a></h3>
						<ul id="submenu-4" class="collapse">
							<li><a href="mChangef"><i
									class="fa fa-angle-double-right"></i> 내정보변경</a></li>
							<li><a href="mWdrawal"><i
									class="fa fa-angle-double-right"></i> 회원탈퇴</a></li>
						</ul></li>
					<li><h3><a href="#" data-toggle="collapse"
						data-target="#submenu-5"><i class="fa fa-fw fa-star"></i>
							판매자 메뉴 <i class="fa fa-fw fa-angle-down pull-right"></i></a></h3>
						<ul id="submenu-5" class="collapse">
							<li><a href="sGForm"><i
									class="fa fa-angle-double-right"></i> 상품등록</a></li>
							<li><a href="sGUForm"><i
									class="fa fa-angle-double-right"></i> 등록상품 수정</a></li>
							<li><a href="sRGoods"><i
									class="fa fa-angle-double-right"></i> 나의 상품</a></li>
							<li><a href="sOList"><i
									class="fa fa-angle-double-right"></i> 주문목록</a></li>
						</ul></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</nav>

		<div id="page-wrapper">
			<div class="container-fluid">
				<!-- Page Heading -->
				<div class="row" id="main"
					style="min-height: 1000px; margin-top: 120px;">
					<div class="col-sm-12 col-md-12 well" id="content">
						<!-- 메인공간 -->


						<div class="tabs-container-style-1">
							<div class="col-md-12 col-xs-12">
								<ul id="myTab" class="nav nav-tabs" style="font-size: 1.2em;">
									<li class="active"><a href="#home" data-toggle="tab">평가
											가능 상품</a></li>
									<li class=""><a href="#profile" data-toggle="tab">내가
											평가한 상품</a></li>
								</ul>
							</div>
							<div id="myTabContent" class="tab-content container">
								<div class="tab-pane fade active in" id="home">
									<div class="col-md-12 col-xs-12">
										<h4>
											적립 예정 포인트<span class="h3" style="color: crimson">900</span>점<br>
											평가 시 결제 가격의<span class="h3" style="color: crimson">5%</span>의
											포인트가 적립 됩니다.
										</h4>
									</div>
									<div class="container">
										<c:forEach begin="1" end="6">
											<div class="col-md-5 col-xs-12 item-size"
												style="margin: 5px 5px;">
												<table style="width: 100%;">
													<tbody>
														<tr>
															<td><img class="img-responsive"
																src="resources/images/item6.jpg"></td>
															<td>이즈칸 캣 그레인프리 어덜트 6.5kg</td>
															<td><button class="btn btn-warning text-center">평가하기</button></td>
														</tr>
													</tbody>
												</table>
											</div>
										</c:forEach>
									</div>
								</div>
								<!-- end of goodsDetail -->

								<div class="tab-pane fade" id="profile">
									<div class="col-md-12 col-xs-12">

										<span class="h3" style="color: crimson">평가해주셔서 감사합니다.</span>

									</div>
									<div class="container">
										<c:forEach begin="1" end="6">
											<div class="col-md-5 col-xs-12 item-size"
												style="margin: 5px 5px;">
												<table style="width: 100%;">
													<tbody>
														<tr>
															<td><img class="img-responsive"
																src="resources/images/item6.jpg"></td>
															<td>
																<p>이즈칸 캣 그레인프리 어덜트 6.5kg</p>
																<p>
																<div class="rating">
																	<i class="glyphicon glyphicon-star"></i> <i
																		class="glyphicon glyphicon-star"></i> <i
																		class="glyphicon glyphicon-star"></i> <i
																		class="glyphicon glyphicon-star"></i> <i
																		class="glyphicon glyphicon-star half"></i>
																</div>
																</p>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
										</c:forEach>
									</div>
								</div>
								<!-- end of change -->
							</div>
						</div>
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
</body>
<footer>
	<div class="article">
		<jsp:include page="../footer.jsp" />
	</div>
</footer>
</html>