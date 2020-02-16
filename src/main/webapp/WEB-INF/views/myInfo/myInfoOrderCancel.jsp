<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문취소 | Catpple</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="resources/custom/addCSS/myroom.css">
<link rel="stylesheet" href="resources/custom/addCSS/footer.css">
<link rel="stylesheet" href="resources/custom/addCSS/star-rating.css">
<link rel="stylesheet" href="resources/custom/addCSS/checkbox.css">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean"
	rel="stylesheet">
<style>
th, td {
	text-align: center;
}

@media (max-width : 768px) {
	  .hide-div{
	  width:0px;
	  height:0px;
	  font-size:0px;
	  }
	  .img {
		width: 100%;
	}
	.content {
		padding-right: 0px;
		padding-left: 0px;
	}
	}


@media ( min-width : 968px) {
	.img {
		width: 70%;
	}
	.content {
		margin-top: 5%;
	}
}
</style>
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
				<li>
				<a href="#" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="Good">
					<i class="fa fa-bar-chart-o"></i> </a></li>
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
							<li><a href="sDCList"><i
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
					<div class="col-md-12 col-xs-12">
					<span class="h1" id="opList" style="color: crimson;">주문취소(${fn:length(canceledList)})</span>
					</div>
					<div class="col-xs-12 col-md-12" id="content" style="background-color:white;margin-top:30px;">
						<!-- 메인공간 -->
							
						<div class="col-md-10 col-xs-12 text-center" style="padding-left:0px;padding-right:0px;">
							<c:forEach var="cList" items="${canceledList}" varStatus="status">
								<div class="container text-center"
									style="border-top: 2px solid lightgray; padding-top: 10px; padding-bottom: 10px;">
									<div class="col-md-3 col-xs-12" style="padding-top: 10px;">
										<img class="img"
											src="resources/sellerInfo/${cList.sellerID}/${cList.gImg1}">
									</div>
									<div class="col-md-4 col-xs-12 content">
										<h4>${cList.gName}</h4>
										<h3>${cList.sellerID}</h3>
										<h3 style="color:lightgray;">(<span id="addHyphen${status.index}">${cList.mPhone}</span>)</h3>
									</div>
									<div class="col-md-2 col-xs-12 content">
										<h4>총금액 : <fmt:formatNumber value="${cList.midPrice}"
												pattern="#,###" />원</h4>
									</div>
									<div class="col-md-2 col-xs-12 content">
										<div class="col-md-12 col-xs-6"
											style="padding-right: 0px; padding-left: 0px;">
											<h4>결제수단: ${cList.pPayment}</h4>
										</div>
										<div class="col-md-12 col-xs-6"
											style="margin-top: 10px; margin-bottom: 10px;">
											<c:if test="${cList.oStatus eq '취소완료'}">
												<span class="label label-default" style="font-size: 1.5em;">상태 : ${cList.oStatus}</span>
											</c:if>
											<c:if test="${cList.oStatus eq '취소요청'}">
												<span class="label label-danger" style="font-size: 1.5em;">상태 : ${cList.oStatus}</span>
											</c:if>
										</div>

									</div>
								</div>
							</c:forEach>
						</div>
							<div class="col-md-10 col-xs-12 text-center">
								<ul class="btn-group pagination">
									<c:if test="${pageMaker.prev}">
										<li>
										<a aria-label="Previous" href="mOCancel${pageMaker.makeSearch(pageMaker.startPage-1)}"><span aria-hidden="true">&laquo;</span></a>
									  	</li>
									  </c:if>
									  <c:forEach begin="${pageMaker.startPage}"
											   end="${pageMaker.endPage}" var="idx">
											   <c:choose>
											   <c:when test="${pageMaker.cri.page==idx}">
										  		 <li>
									 			<a class="btn btn-danger disabled" style="color:white;">${idx}</a>
									 			</li>
										 		</c:when>
										 		<c:otherwise>
										 		<li>
									 			<a href="mOCancel${pageMaker.makeSearch(idx)}">${idx}</a>
									 			</li> 
									 			</c:otherwise>
									 			</c:choose>
										<%-- <c:out value="${pageMaker.cri.page == idx ? 'class =active':''}"/> --%>
									  </c:forEach>
									
									  <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
										<li>
										<a href="mOCancel${pageMaker.makeSearch(pageMaker.endPage+1)}"><span aria-hidden="true">&raquo;</span></a>
									  	</li>
									  </c:if>
										
								</ul>
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