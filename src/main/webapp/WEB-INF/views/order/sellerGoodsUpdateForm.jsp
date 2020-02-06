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
					<c:if test="${logInUser.mGrade!='S'}">
							<li><h3>
							<a href="#" data-toggle="collapse" data-target="#submenu-1"
								aria-expended="true"><i class="fa fa-fw fa-search"></i>내지갑 <i
								class="fa fa-fw fa-angle-down pull-right"></i></a>
						</h3>
						<ul id="submenu-1" class="collapse">
							<li><a href="mpoint" ><i
									class="fa fa-angle-double-right"></i> 포인트</a></li>
						</ul>
					</li>
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
					<li><h3><a href="#" data-toggle="collapse"
						data-target="#submenu-4"><i class="fa fa-fw fa-star"></i>
							내정보 <i class="fa fa-fw fa-angle-down pull-right"></i></a></h3>
						<ul id="submenu-4" class="collapse">
							<li><a href="mChangef"><i
									class="fa fa-angle-double-right"></i> 내정보변경</a></li>
							<li><a href="mWdrawal"><i
									class="fa fa-angle-double-right"></i> 회원탈퇴</a></li>
						</ul></li>
						
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
							<h2 style="margin-top: 5%;">상품 수정 및 삭제</h2>
							<form action="gupdate" method="post" enctype="multipart/form-data">
								<div style="margin: 10px 30px;">
							
									<!-- Row1 아이디/이름-->
									<div class="row">
										<h3>판매자 정보</h3>
										<!-- Grid column -->
										<div class="col-md-3 col-xs-6">
											<!-- Material input -->
											<div class="form-group">
												<label for="memberID">ID</label> <input type="text" value="${ginfo.member_mid}"
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
												<label for="goodsNumber">상품번호</label> <input type="text" name="gnum"
													class="form-control" id="goodsNumber" value="${ginfo.gnum}"
													readonly="readonly">
											</div>
										</div>
										<!-- Grid column  -->
										<div style="margin-top: 35px;">
										<div class="col-md-3 col-xs-12">
											<select id="sidoSelect" class="form-control" name="gcategory"
												onChange="changeSidoSelect();">
												<option value="">대분류</option>
											</select>
  										</div>
  										<div class="col-md-3 col-xs-12">
    										<select id="gugunSelect" class="form-control"
												name="gcategory2" onChange="changeSecondSelect();">
												<option value="">소분류</option>
											</select>
										</div>
										</div>
										<!-- Grid column -->
									</div>
									<!-- row3 상품이름 -->
									<div class="row">
										<!-- Grid column -->
										<div class="col-md-9 col-xs-12">
											<!-- Material input -->
											<div class="form-group">
												<label for="goodsName">상품 이름</label> <input type="text" name="gname"
													class="form-control" id="goodsName" value="${ginfo.gname}">

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
												 readonly="readonly" value="${ginfo.gdate}">
											</div>
										</div>
										<!-- Grid column -->
										<div class="col-md-3 col-xs-6">
											<label for="goodsPrice">상품 가격</label>
											<!-- Material input -->
											<div class="form-group">
												<div class="input-group">
													<input type="number" class="form-control" id="goodsPrice" name="gprice"
														placeholder="0" value="${ginfo.gprice}"> <span class="input-group-addon">원</span>
												</div>
											</div>
										</div>
										<!-- Grid column -->
										<div class="col-md-3 col-xs-6">
											<label for="goodsAmount">상품 추가</label>
											<!-- Material input -->
											<div class="form-group">
												<div class="input-group">
													<input type="number" class="form-control" id="goodsAmount" name="gstock"
														placeholder="0" value="${ginfo.gstock}"> <span class="input-group-addon">개</span>
												</div>
											</div>
										</div>
									</div>
									<!-- /row4 -->

									<!-- row6 상품 이미지 -->
									<div class="row">
										<div class="col-md-6 col-xs-12">
											<label for="goodsInfo">상품 메인이미지</label>
											<div class="form-group">
												<input class="form-control" type="file" id="uploadfilef"
													name="gimgf1">

											</div>
										</div>

										<div class="col-md-6 col-xs-12">
											<label for="goodsInfo">상품 상세이미지</label>
											<div class="form-group">
												<input class="form-control" type="file" id="uploadfilef2"
													name="gimgf2" >
											</div>
										</div>
									</div>
									<!-- /row6 -->
									<div class="col-md-3 col-md-offset-5 col-xs-8 col-xs-offset-3">
										<button type="submit" class="btn btn-primary btn-md" onclick="checkUpdateFile()">수정</button>
										<button type="button" class="btn btn-primary btn-md">삭제</button>
									</div>
								</div>
							</form>
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
	<script src="resources/custom/addJS/goods.js"></script>
</body>
<footer>
	<div class="article">
		<jsp:include page="../footer.jsp" />
	</div>
</footer>
</html>