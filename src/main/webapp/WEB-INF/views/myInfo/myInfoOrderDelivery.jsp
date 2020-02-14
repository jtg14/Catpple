<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
@media (max-width : 768px) {
	.table-font{
	font-size:1em;
	}
	.responsiveTd{
		width:30%;
	}
	.row{
		margin-top:120px;
	}
}


@media ( min-width : 968px) {
	.table-font{
	font-size:1.5em;
	}
	.responsiveTd{
		width:50%;
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
								<li><a href="sDCList"><i
										class="fa fa-angle-double-right"></i> 배송완료목록</a></li>
							</ul></li>
					</c:if>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</nav>

		<div id="page-wrapper">
			<div class="container">
				<!-- Page Heading -->
				<div class="row" id="main"
					style="min-height: 1000px;"	>
					<div class="col-sm-12 col-md-10" id="content"
						style="background-color: white;">
						<!-- 메인 공간 -->
						<div class="col-md-12 col-xs-12">
							<h2>주문 /배송 조회</h2>
							<div class="col-md-12 col-xs-12"
								style="border: 5px solid crimson; border-radius: 10px; padding: 20px 10px; text-align: center; min-height: 600px;">
								<label style="width: 100%; font-size: 1.2em;"> <strong>주문
										번호를 클릭하면 해당 주문 목록을 볼 수 있습니다.</strong>
								</label>
								<div class="col-md-12 col-xs-12"
									style="border-top: 1px solid darkgray; padding-left: 0px; padding-right: 0px;">
									<table class="table">
										<thead>
											<tr id="first-row">
												<td>주문일</td>
												<td class="responsiveTd">주문번호</td>
												<td>결재금액</td>
											</tr>
										</thead>

										<tbody class="table-font">
											<c:forEach var="plist" items="${plist}">
												<tr>
													<td>${plist.pDate}</td>
													<td style="max-width: 35%;"><a href="#"
														onclick="oplist(${plist.pNum},'${logInUser.mId}')">${plist.pNum}</a>
													</td>
													<td><fmt:formatNumber value="${plist.pPrice}"
															pattern="#,###" />원</td>

												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<div class="col-md-12 col-xs-12 text-center">
						<ul class="btn-group pagination">
							<c:if test="${pageMaker.prev}">
								<li>
								<a aria-label="Previous" href="mODelivery${pageMaker.makeSearch(pageMaker.startPage-1)}"><span aria-hidden="true">&laquo;</span></a>
							  	</li>
							  </c:if>
							  <c:forEach begin="${pageMaker.startPage}"
									   end="${pageMaker.endPage}" var="idx">
								 		<li>
							 			<a href="mODelivery${pageMaker.makeSearch(idx)}">${idx}</a>
							 		</li> 
								<%-- <c:out value="${pageMaker.cri.page == idx ? 'class =active':''}"/> --%>
							  </c:forEach>
							
							  <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li>
								<a href="mODelivery${pageMaker.makeSearch(pageMaker.endPage+1)}"><span aria-hidden="true">&raquo;</span></a>
							  	</li>
							  </c:if>
								
						</ul>
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