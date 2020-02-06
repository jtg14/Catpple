<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean"
	rel="stylesheet">
	<title>1:1 문의 | Catpple</title>
<style>
.board-content {
	width: 45%;
	
}

th, td {
	text-align: center;
}

@media ( min-width : 968px) {
	tbody {
		font-size: 18px;
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
				<a class="navbar-brand logo" style="margin-top: 0px;padding-top: 0px;" href="home">
					<img src="resources/images/CatppleLogo.png" style="width:140px;">
				</a>
			</div>
			<!-- Top Menu Items -->
			<ul class="nav navbar-right top-nav">
				<li><c:choose>
				<c:when test="${logInUser ne null }">
				<a href="#" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="Good">
				</c:when>
				<c:when test="${logInUser eq null }">
				<a href="#" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="No User">
				</c:when>
				</c:choose></li>
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
							<c:if test="${logInUser.mGrade!='S'}">
							<li><a href="mpoint" ><i
									class="fa fa-angle-double-right"></i> 포인트</a></li></c:if>
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
					<!-- 메인공간 -->

						<div class="col-md-10 col-xs-12">
							<div class="col-md-12 col-xs-12">
								<h2>1:1 문의 내역</h2>
							</div>
							<table class="table">
								<thead>
									<tr>
										<c:if test="${logInUser.mGrade=='a'}">
											<th>작성자ID</th>
										</c:if>
										<th>구분</th>
										<th class="board-content"
											style="padding-right: 0px; padding-left: 0px;">제목</th>
										<th>작성일</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										
										<c:when test="${logInUser.mGrade=='C'}">
											<c:forEach var="list" items="${list}" varStatus="">
												<tr>
													<td style="padding-left: 0px;padding-right: 0px; width:25%;">
													<c:choose>
															<c:when test="${list.separation=='1'}">
														[구매 관련]
													</c:when>
															<c:when test="${list.separation=='2'}">
														[배송 관련]
													</c:when>
															<c:when test="${list.separation=='3'}">
														[결제 문의]
													</c:when>
															<c:when test="${list.separation=='4'}">
														[기타]
													</c:when>
															<c:otherwise>
														[건의사항]
													</c:otherwise>
														</c:choose></td>
													<td class="board-content" style="padding-right: 0px; padding-left: 0px; text-align: left;">
														<a href="mBDetail?bNum=${list.bNum}&pageCode=I">
														   <c:choose>
																<c:when test="${list.bReply!='0'and list.bReply!='1'}">
																	<span class="label label-danger"
																		style="margin-right: 10px;">답변완료</span>
																</c:when>
																<c:otherwise>
																	<span class="label label-success"
																		style="margin-right: 10px;">답변대기중</span>
																</c:otherwise>
														   </c:choose> ${list.bTitle}
														</a>
													</td>
													<td style="padding-right: 0px;">${list.bDate}</td>
												</tr>
											</c:forEach>
											
										</c:when>
										 
										<c:when test="${logInUser.mGrade=='a'}">
											<c:forEach var="listForManager" items="${listForManager}"
												varStatus="">
												<tr>
													<td>
														${listForManager.member_mId}
													</td>
													<td style="padding-left: 0px;padding-right: 0px; width:25%;">
													<c:choose>
															<c:when test="${listForManager.separation=='1'}">
														[구매 관련]
													</c:when>
															<c:when test="${listForManager.separation=='2'}">
														[배송 관련]
													</c:when>
															<c:when test="${listForManager.separation=='3'}">
														[결제 문의]
													</c:when>
															<c:when test="${listForManager.separation=='4'}">
														[기타]
													</c:when>
														</c:choose></td>
													<td class="board-content"
														style="padding-right: 0px; padding-left: 0px; text-align: left;"><a
														href="mBDetail?bNum=${listForManager.bNum}&pageCode=I"> <c:choose>
																<c:when
																	test="${listForManager.bReply!='0'and listForManager.bReply!='1'}">
																	<span class="label label-danger"
																		style="margin-right: 10px;">답변완료</span>
																</c:when>
																<c:otherwise>
																	<span class="label label-success"
																		style="margin-right: 10px;">답변대기중</span>
																</c:otherwise>
															</c:choose> ${listForManager.bTitle}
													</a></td>
													<td style="padding-right: 0px;">${listForManager.bDate}</td>
												</tr>
											</c:forEach>

										</c:when>
									</c:choose>
								</tbody>
							</table>
						</div>

						<!-- paging -->
						<div class="col-md-10 col-xs-12 text-center">
							<c:choose>
								<c:when test="${currPage>1}">
									<a href="mCustomerInquiry?currPage=1">First</a>&nbsp;
									<a href="mCustomerInquiry?currPage=${currPage-1}">이전</a>&nbsp;&nbsp;
								</c:when>
								<c:otherwise>
									<font color="gray">First&nbsp;이전&nbsp;&nbsp;</font>
								</c:otherwise>
							</c:choose>
							
							<c:forEach  var="i"  begin="${sPage}" end="${ePage}">
								<c:choose>
									<c:when test="${i==currPage}">
										<font size="5" color="Orange">${i}&nbsp;</font>
									</c:when>
									<c:otherwise>
										<a href="mCustomerInquiry?currPage=${i}">${i}&nbsp;</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<c:choose>
								<c:when test="${currPage==totalPageNo}">
									<font color="gray">&nbsp;&nbsp;다음&nbsp;Last</font>
								</c:when>
								<c:otherwise>
									<a href="mCustomerInquiry?currPage=${currPage+1}">&nbsp;다음</a>&nbsp;
									<a href="mCustomerInquiry?currPage=${totalPageNo}">Last</a>&nbsp;
								</c:otherwise>
							</c:choose>
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