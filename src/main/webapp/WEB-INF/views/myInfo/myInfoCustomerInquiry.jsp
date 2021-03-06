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
<link
	href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean"
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

@media ( max-width :768px) {
	.row {
		margin-top: 120px;
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
			<div class="container-fluid">
				<!-- Page Heading -->
				<div class="row" id="main"
					style="min-height: 1000px;">
					<div class="col-sm-12 col-md-12" id="content">
						<!-- 메인공간 -->

						<div class="col-md-10 col-xs-12"
							style="padding-left: 0px; padding-right: 0px;">
							<div class="col-md-12 col-xs-12">
								<h2>1:1 문의 내역</h2>
							</div>
							<div id="searchBar" class="col-md-12 col-xs-12"
								style="padding-left: 0px; padding-right: 0px;">
								<div class="col-md-12 col-xs-12 form-group"
									style="padding-right: 0px; padding-left: 0px;">
									<div class="col-md-1 col-md-offset-7 col-xs-3"
										style="padding-right: 0px; padding-left: 0px;">
										<select name="searchType" class="form-control"
											style="float: right;">
											<option value="n"
												<c:out value="${pageMaker.cri.searchType == null?'selected':''}"/>>
												---</option>
											<option value="t"
												<c:out value="${pageMaker.cri.searchType eq 't'?'selected':''}"/>>
												제목</option>
											<option value="c"
												<c:out value="${pageMaker.cri.searchType eq 'c'?'selected':''}"/>>
												내용</option>
											<option value="tc"
												<c:out value="${pageMaker.cri.searchType eq 'tc'?'selected':''}"/>>
												제목과 내용</option>
										</select>
									</div>
									<div class="col-md-3 col-xs-6">
										<input type="text" name='keyword' id="keywordInput"
											class="form-control " value='${pageMaker.cri.keyword}'>
									</div>
									<div class="col-md-1 col-xs-3 text-center" 
										style="padding-right: 0px; padding-left: 0px;">
										<a class="btn btn-success btn-block" id="searchBtn">Search</a>
									</div>
								</div>
							</div>	
							
						</div>
							<div class="col-md-10 col-xs-12">
								<table class="table">
									<thead>
										<tr>
											<c:if test="${logInUser.mGrade=='A'}">
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
														<td
															style="padding-left: 0px; padding-right: 0px; width: 25%;">
															<c:choose>
																<c:when test="${list.bSeparation=='1'}">
														[구매 관련]
													</c:when>
																<c:when test="${list.bSeparation=='2'}">
														[배송 관련]
													</c:when>
																<c:when test="${list.bSeparation=='3'}">
														[결제 문의]
													</c:when>
																<c:when test="${list.bSeparation=='4'}">
														[기타]
													</c:when>
																<c:otherwise>
														[건의사항]
													</c:otherwise>
															</c:choose>
														</td>
														<td class="board-content"
															style="padding-right: 0px; padding-left: 0px; text-align: left;">
															<a href="mBDetail?bNum=${list.bNum}&pageCode=I"> <c:choose>
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

											<c:when test="${logInUser.mGrade=='A'}">
												<c:forEach var="listForManager" items="${listForManager}"
													varStatus="">
													<tr>
														<td>${listForManager.member_mId}</td>
														<td
															style="padding-left: 0px; padding-right: 0px; width: 25%;">
															<c:choose>
																<c:when test="${listForManager.bSeparation=='1'}">
														[구매 관련]
													</c:when>
																<c:when test="${listForManager.bSeparation=='2'}">
														[배송 관련]
													</c:when>
																<c:when test="${listForManager.bSeparation=='3'}">
														[결제 문의]
													</c:when>
																<c:when test="${listForManager.bSeparation=='4'}">
														[기타]
													</c:when>
															</c:choose>
														</td>
														<td class="board-content"
															style="padding-right: 0px; padding-left: 0px; text-align: left;"><a
															href="mBDetail?bNum=${listForManager.bNum}&pageCode=I">
																<c:choose>
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
								
						<!--  PagingCri Code 추가   -->

						<div  class="container" style="text-align: center;">
							<ul class="pagination">
								<c:if test="${pageMaker.prev}">
									<li><a href="mCustomerInquiry${pageMaker.makeSearch(1)}"
										style="color: black;">First</a></li>
									<li><a
										href="mCustomerInquiry${pageMaker.makeSearch(pageMaker.startPage - 1)}"
										style="color: black;">이전</a></li>
								</c:if>

								<c:forEach begin="${pageMaker.startPage}"
									end="${pageMaker.endPage}" var="idx">
									<c:choose>
										<c:when test="${pageMaker.cri.page==idx}">
											<li class="active"><a
												href="mCustomerInquiry${pageMaker.makeSearch(idx)}"
												style="background-color: Crimson; border-color: Crimson;">${idx}</a></li>
										</c:when>
										<c:otherwise>
											<li><a
												href="mCustomerInquiry${pageMaker.makeSearch(idx)}"
												style="color: black;">${idx}</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>

								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li><a
										href="mCustomerInquiry${pageMaker.makeSearch(pageMaker.endPage + 1)}"
										style="color: black;">다음</a></li>
									<li><a
										href="mCustomerInquiry${pageMaker.makeSearch(pageMaker.lastPage)}"
										style="color: black;">Last</a></li>
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
		</div>
		
		<!-- /#wrapper -->


		<script src="resources/bootstrap/js/jquery-3.2.1.min.js"></script>
		<script src="resources/bootstrap/js/bootstrap.js"></script>
		<script src="resources/custom/addJS/myroom.js"></script>
		<script src="resources/custom/addJS/minifunction.js"></script>
		<script>
			$(function() {
				$('#searchBtn').on(
						"click",
						function(event) {
							self.location = "mCustomerInquiry"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();
						}); // on
			}); // ready
		</script>
</body>
<footer>
	<div class="article">
		<jsp:include page="../footer.jsp" />
	</div>
</footer>
</html>