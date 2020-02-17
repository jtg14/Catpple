<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록된 상품수정 | Catpple</title>
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="resources/custom/addCSS/myroom.css">
<link rel="stylesheet" href="resources/custom/addCSS/footer.css">
<link rel="stylesheet" href="resources/custom/addCSS/star-rating.css">
<link rel="stylesheet" href="resources/custom/addCSS/checkbox.css">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean"
	rel="stylesheet">

</head>
<body class="font-Jua">

	<div id="throbber" style="display: none; min-height: 120px;"></div>
	<div id="noty-holder"></div>
	<div id="wrapper">
		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-fixed-top"
			style="background-color: white;" role="navigation">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-ex1-collapse" >
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand logo" style="margin-top: 0px;padding-top: 0px;" href="home">
					<img src="resources/images/CatppleLogo.png" style="width:140px;">
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
			<div class="collapse navbar-collapse navbar-ex1-collapse" style="max-height:700px;background-color:white;">
				<ul class="nav navbar-nav side-nav" style="height: 90%;">
					<li><h3><a href="#" data-toggle="collapse"
						data-target="#submenu-4"><i class="fa fa-fw fa-star"></i>
							내정보 <i class="fa fa-fw fa-angle-down pull-right"></i></a></h3>
						<ul id="submenu-4" class="collapse">
							<li><a href="mChangef"><i
									class="fa fa-angle-double-right"></i> 내정보변경</a></li>
							<li><a href="mWdrawal"><i
									class="fa fa-angle-double-right"></i> 회원탈퇴</a></li>
						</ul></li>
					<c:if test="${logInUser.mGrade!='S'}">
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
									class="fa fa-angle-double-right"></i> 장바구니<span class="label label-danger">${cartRow}</span></a></li>
						</ul></li>
					<li><h3><a href="#" data-toggle="collapse"
						data-target="#submenu-3"><i class="fa fa-fw fa-star"></i>
							고객센터 <i class="fa fa-fw fa-angle-down pull-right"></i></a></h3>
						<ul id="submenu-3" class="collapse">
							<li><a href="mCustomerInquiry"><i
									class="fa fa-angle-double-right"></i> 1:1문의</a></li>
							<li><a href="mFAQ"><i
									class="fa fa-angle-double-right"></i> FAQ</a></li>
							<li><a href="mSuggestions"><i
									class="fa fa-angle-double-right"></i> 건의사항</a></li>
							<li><a href="mWriting"><i
									class="fa fa-angle-double-right"></i> 글쓰기 (모든글)</a></li>
						</ul></li>
						</c:if>						
						<c:if test="${logInUser.mGrade!='C'}">
						<li><h3><a href="#" data-toggle="collapse"
						data-target="#submenu-5"><i class="fa fa-fw fa-star"></i>
							판매자 메뉴 <i class="fa fa-fw fa-angle-down pull-right"></i></a></h3>
						<ul id="submenu-5" class="collapse">
							<li><a href="sGForm"><i
									class="fa fa-angle-double-right"></i> 상품등록</a></li>
							<li><a href="sRGoods"><i
									class="fa fa-angle-double-right"></i> 나의 상품</a></li>
							<li><a href="sOList"><i
									class="fa fa-angle-double-right"></i> 주문목록</a></li>
							<li><a href="sOList?dCode=C"><i
									class="fa fa-angle-double-right"></i> 배송완료목록</a></li>
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
						<!-- 메인 공간 -->

						<c:set var="ginfo" value="${goodsDetail}"/>
						<div class="col-md-8 col-md-offset-1 col-xs-12"
							style="border: 5px solid crimson; border-radius: 10px; padding-bottom: 10px;">
							<h2 style="margin-top: 5%;">상품 수정 </h2>
							
								<div style="margin: 10px 30px;">
							
									<!-- Row1 아이디/이름-->
									<div class="row">
										<h3>판매자 정보</h3>
										<!-- Grid column -->
										<div class="col-md-3 col-xs-6">
											<!-- Material input -->
											<div class="form-group">
												<label for="memberID">ID</label> <input type="text" value="${ginfo.member_mId}"
													class="form-control" id="memberID" placeholder="ID"
													readonly="readonly">
											</div>
										</div>
										<!-- Grid column  -->

										<!-- Grid column -->
										<div class="col-md-3 col-xs-6">
											<!-- Material input -->
											<div class=" form-group">
												<label for="memberName">이름</label> <input type="text" value="${ginfo.company}"
													class="form-control" id="memberName" placeholder="이름"
													readonly="readonly">
											</div>
										</div>
										<!-- Grid column -->
									</div>
									<hr class="divider">
									<!-- /row1  -->



									<!-- row2 상품번호/카테고리 코드 -->
									<div class="row">
										<h3>상품 정보</h3>

										<!-- Grid column -->
										<div class="col-md-3 col-xs-6">
											<!-- Material input -->
											<div class="form-group">
												<label for="goodsNumber">상품번호</label> <input type="text" name="gNum"
													class="form-control" id="goodsNumber" value="${ginfo.gNum}"
													readonly="readonly">
											</div>
										</div>
									</div>
									<!-- row3 상품이름 -->
									<div class="row">
										<!-- Grid column -->
										<div class="col-md-9 col-xs-12">
											<!-- Material input -->
											<div class="form-group">
												<label for="goodsName">상품 이름</label> <input type="text" name="gName"
													class="form-control" readOnly ="readOnly" id="goodsName" value="${ginfo.gName}">

											</div>
										</div>
										<!-- Grid column -->
									</div>
									<!-- /row3 -->


									<!-- row4 상품가격/상품수량/등록날짜 -->
									<div class="row">

										<div class="col-md-3 col-xs-12">
											<label for="goodsRegDate">등록 날짜</label>
											<!-- Material input -->
											<div class="form-group">
												<input type="text" class="form-control" id="goodsRegDate"
												 readonly="readonly" value="${ginfo.gDate}">
											</div>
										</div>
										<!-- Grid column -->
										<div class="col-md-3 col-xs-6">
											<label for="goodsPrice">상품 가격</label>
											<!-- Material input -->
											<div class="form-group">
												<div class="input-group">
													<input type="number" class="form-control" id="goodsPrice" 
														placeholder="0" value="${ginfo.gPrice}"> <span class="input-group-addon">원</span>
												</div>
											</div>
										</div>
										<!-- Grid column -->
										<div class="col-md-3 col-xs-6">
											<label for="goodsAmount">상품 추가</label>
											<!-- Material input -->
											<div class="form-group">
												<div class="input-group">
													<input type="number" class="form-control" id="goodsAmount" 
														placeholder="0" value="${ginfo.gStock}"> <span class="input-group-addon">개</span>
												</div>
											</div>
										</div>
									</div>
									<!-- /row4 -->
									<!-- row6 상품 이미지 -->
									<!-- /row6 -->
									<div class="col-md-12 col-xs-12 text-center">
										<a type="button" class="btn btn-primary btn-lg" onclick="checkUpdateFile('${ginfo.gNum}')">수정</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /#page-wrapper -->
	<!-- /#wrapper -->


	<script src="resources/bootstrap/js/jquery-3.2.1.min.js"></script>
	<script src="resources/bootstrap/js/bootstrap.js"></script>
	<script src="resources/custom/addJS/myroom.js"></script>
	<script src="resources/custom/addJS/goods.js"></script>
</body>
<footer>
	<div class="article">
		<jsp:include page="../footer.jsp" />
	</div>
</footer>
</html>