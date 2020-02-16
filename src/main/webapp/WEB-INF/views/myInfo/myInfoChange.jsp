<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보 변경 | Catpple</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="resources/custom/addCSS/myroom.css">
<link rel="stylesheet" href="resources/custom/addCSS/footer.css">
<link rel="stylesheet" href="resources/custom/addCSS/star-rating.css">
<link rel="stylesheet" href="resources/custom/addCSS/checkbox.css">
<link
	href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean"
	rel="stylesheet">
<style type="text/css">
.font-Jua {
	font-family: Jua;
}

.order-card {
	width: 72;
	height: 72;
}

.current-status {
	border-bottom: 5px solid deepskyblue;
	border-radius: 3px;
}

.order-item {
	border: 4px solid lightgray;
	border-radius: 2em;
	margin-bottom: 20px;
	margin-top: 20px;
}

.div-bgcolor-lightgray {
	background-color: lightgray;
}

.div-bgcolor-white {
	background-color: white;
}

.table-head {
	width: 28%;
}

@media ( max-width : 768px) {
	.first-div {
		border-top: 1px solid lightgray;
	}
	.row{
		margin-top:120px;
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
					data-target=".navbar-ex1-collapse">
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
					<div class="col-sm-12 col-md-12" id="content">
						<!-- 메인 공간 -->

						<h1>내 정보 수정</h1>
						<div class="col-md-12 col-xs-12">
							<div class="col-md-6 col-xs-12 text-center">
								<div class="container"
									style="border: 5px solid crimson; border-radius: 10px; padding: 20px;">

									<form action="mchange" method="post">
										<table class="table text-center">
											<tr>
												<td class="table-head"
													style="padding-left: 0px; padding-right: 0px;">아이디</td>
												<td style="text-align: left;">
													<div class="col-md-6 col-xs-12" style="padding-left: 0px;">
														<input class="form-control input-sm" type="text"
															readonly="readonly" name="mId" value="${logInUser.mId}">
													</div>
												</td>
											</tr>
											<tr>
												<td class="table-head"
													style="padding-left: 0px; padding-right: 0px;">비밀번호
												</td>
												<td style="text-align: left;">
												<div class="col-md-6 col-xs-12" style="padding-left: 0px;">
													<a class="btn btn-primary" type="button" onclick="find()">비밀번호 변경하기</a>
												</div>
												</td>
											</tr>
											<tr>
												<td class="table-head"
													style="padding-left: 0px; padding-right: 0px;">이메일</td>
												<td style="text-align: left;">
													<div class="col-md-6 col-xs-12" style="padding-left: 0px;">
														<input class="form-control input-sm" type="text"
															readonly="readonly" id="mEmail" name="mEmail"
															value="${logInUser.mEmail}" placeholder="이메일">
													</div>
													<div class="col-md-6 col-xs-6" style="margin-bottom: 8px;">
														<button type="button" id="emailChangeBtn" onclick="ecBtn()" class="btn btn-sm">이메일변경</button>
													</div>
												</td>
											</tr>
											<tr>
												<td class="table-head"
													style="padding-left: 0px; padding-right: 0px;">휴대폰</td>
												<td style="text-align: left;">
													<div class="col-md-6 col-xs-12" style="padding-left: 0px;">
														<input class="form-control input-sm" type="text"
															readonly="readonly" name="mPhone" id="mPhone"
															value="${logInUser.mPhone}" placeholder="휴대폰번호">
													</div>
													<div class="col-md-6 col-xs-6" style="margin-bottom: 8px;">
														<button type="button" onclick="pcBtn()" class="btn btn-sm">휴대폰변경</button>
													</div>
												</td>
											</tr>
											<tr>
												<td class="table-head"
													style="padding-left: 0px; padding-right: 0px;">이름</td>
												<td style="text-align: left;">
													<div class="col-md-6 col-xs-12">${logInUser.mName}</div>
												</td>
											</tr>
											<c:choose>
												<c:when test="${logInUser.mAddr1!=0}">
													<tr>
														<td class="table-head"
															style="padding-left: 0px; padding-right: 0px;">주소</td>
														<td style="text-align: left;">
															<div class="col-md-2 col-xs-6" style="padding-left: 0px;">
																<input type="text" class="form-control input-sm"
																	readonly="readonly" name="mAddr1" id="sample2_postcode"
																	value="${logInUser.mAddr1}" style="margin-bottom: 8px;">
															</div>
															<div class="col-md-10 col-xs-6"
																style="margin-bottom: 8px;">
																<input type="button" class="btn btn-sm" onclick="sample2_execDaumPostcode()" value="주소변경"/>
															</div>
															<div class="col-md-12 col-xs-12"
																style="padding-left: 0px;">
																<input type="text" class="form-control input-sm"
																	readonly="readonly" name="mAddr2" id="sample2_address"
																	value="${logInUser.mAddr2}" style="margin-bottom: 8px;">
															</div>
															<div class="col-md-6 col-xs-12" style="padding-left: 0px;">
																<input type="text" name="mAddr3" placeholder="상세주소"
																	value="${logInUser.mAddr3}" id="sample2_extraAddress"
																	class="form-control input-sm" style="margin-bottom: 8px;">
															</div>
															<div class="col-md-6 col-xs-12" style="padding-left: 0px;">
																<input type="text" name="mAddr4" placeholder="참고항목"
																	value="${logInUser.mAddr4}" id="sample2_detailAddress"
																	class="form-control input-sm" style="margin-bottom: 8px;">
															</div>
															<div id="layer"
																style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
																<img
																	src="//t1.daumcdn.net/postcode/resource/images/close.png"
																	id="btnCloseLayer"
																	style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
																	onclick="closeDaumPostcode()" alt="닫기 버튼">
															</div>
														</td>
													</tr>
												</c:when>
												<c:otherwise>
													<tr>
														<td class="table-head"
															style="padding-left: 0px; padding-right: 0px;">주소</td>
														<td style="text-align: left;">
															<div class="col-md-2 col-xs-6" style="padding-left: 0px;">
																<input type="text" class="form-control input-sm" placeholder="우편번호"
																	readonly="readonly" name="mAddr1" id="sample2_postcode"
																	style="margin-bottom: 8px;">
															</div>
															<div class="col-md-10 col-xs-6"
																style="margin-bottom: 8px;">
																<input type="button" class="btn btn-sm" onclick="sample2_execDaumPostcode()" value="주소변경"/>
															</div>
															<div class="col-md-12 col-xs-12"
																style="padding-left: 0px;">
																<input type="text" class="form-control input-sm" placeholder="주소"
																	readonly="readonly" name="mAddr2" id="sample2_address"
																	style="margin-bottom: 8px;">
															</div>
															<div class="col-md-6 col-xs-12" style="padding-left: 0px;">
																<input type="text" name="mAddr3" placeholder="상세주소"
																	id="sample2_extraAddress"
																	class="form-control input-sm" style="margin-bottom: 8px;">
															</div>
															<div class="col-md-6 col-xs-12" style="padding-left: 0px;">
																<input type="text" name="mAddr4" placeholder="참고항목"
																	id="sample2_detailAddress"
																	class="form-control input-sm" style="margin-bottom: 8px;">
															</div>
															<div id="layer"
																style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
																<img
																	src="//t1.daumcdn.net/postcode/resource/images/close.png"
																	id="btnCloseLayer"
																	style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
																	onclick="closeDaumPostcode()" alt="닫기 버튼">
															</div>
														</td>
													</tr>
												</c:otherwise>
											</c:choose>

											<tr>
												<td class="table-head"
													style="padding-left: 0px; padding-right: 0px;">포인트</td>
												<td style="text-align: left;"><div
														class="col-md-6 col-xs-12">0</div></td>
														class="col-md-6 col-xs-12">${logInUser.mPoint}</div></td>
											</tr>
										</table>
										<div class="col-md-12 col-xs-12">
											<button type="submit" class="btn">수정</button>
										</div>
									</form>

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
	</div>
	<!-- /#wrapper -->


	<script src="resources/bootstrap/js/jquery-3.2.1.min.js"></script>
	<script src="resources/bootstrap/js/bootstrap.js"></script>
	<script src="resources/custom/addJS/myroom.js"></script>
	<script src="resources/custom/addJS/minifunction.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="resources/custom/addJS/kakao.js"></script>
</body>
<footer>
	<div class="article">
		<jsp:include page="../footer.jsp" />
	</div>
</footer>
</html>