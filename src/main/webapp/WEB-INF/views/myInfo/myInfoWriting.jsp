<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/custom/addCSS/star-rating.css">
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="resources/custom/addCSS/myroom.css">
<link rel="stylesheet" href="resources/custom/addCSS/footer.css">
<link rel="stylesheet" href="resources/custom/addCSS/star-rating.css">
<link rel="stylesheet" href="resources/custom/addCSS/checkbox.css">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean"
	rel="stylesheet">
<script src="resources/custom/addJS/myroom.js"></script>
<title>글쓰기 | Catpple</title>
<style>
.item-size {
	border: 3px solid lightgray;
	border-radius: 10px;
}

th, td {
	text-align: center;
}

@media ( min-width : 968px) {
	tbody {
		font-size: 18px;
	}
}

.noresize {
	width: 100%;
	height: 100px;
	resize: none; /* 사용자 임의 변경 불가 */
	/* resize: both; */ /* 사용자 변경이 모두 가능 */
	/* resize: horizontal; */ /* 좌우만 가능 */
	/* resize: vertical; */ /* 상하만 가능 */
}
@media(max-width: 968px){
	#sel{
		font-size:1em;	
	}
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
.btnA{
text-decoration: none;

}
</style>
<script type="text/javascript">
$(function(){
	if($('#sel1>option').val()=='1'){
		
	}
	
	
	
})//ready



</script>
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

						<div class="tabs-container-style-1">
							<div class="col-md-12 col-xs-12">
								<ul id="myTab" class="nav nav-tabs" style="font-size: 1.5em;">
									<li class="active"><a href="#home" data-toggle="tab">1:1문의</a></li>
									<li class=""><a href="#profile" data-toggle="tab">건의사항</a></li>
								</ul>
							</div>
							<div id="myTabContent" class="tab-content container">
								<div class="tab-pane fade active in" id="home">
									<div class="col-md-12 col-xs-12">
										<h2>1:1 문의</h2>
									</div>
									<div class="col-md-12 col-xs-12">
										<h4 style="color: darkgray;">문의 해주시면 친절히 답변해 드리 겠습니다.</h4>
									</div>
									<div class="container">
										<form action="inquiryInsert" method="post" >
											<div class="col-md-12 col-xs-12" >
												<div class="col-md-1 col-xs-4" style="padding-left:0px;" >
													<h3 style="display:inline-block;">
														작성자:
													</h3>
												</div>
												<div class="col-md-2 col-xs-8">
													<span><h3>${logInUser.mId}</h3></span>
												</div>
											</div>
											<div class="col-md-12 col-xs-12">
												<div class="col-md-1 col-xs-4" style="padding-left:0px;">
													<h3>분류:</h3>
												</div>
												<div class="col-md-2 col-xs-8">
													<div class="form-group" style="margin-top: 15px;">
														<select class="form-control" id="separation" name="separation">
															<option value="1">[구매 관련]</option>
															<option value="2">[배송 관련]</option>
															<option value="3">[결제 문의]</option>
															<option value="4">[기타]</option>
														</select>
													</div>
												</div>
											</div>
											<div class="col-md-12 col-xs-12">
												<h3>제목:</h3>
											</div>
											<div class="col-md-12 col-xs-12">
												<input class="form-control input-sm" name="bTitle"
													id="bTitle">
											</div>
											<div class="col-md-12 col-xs-12">
												<h3>내용:</h3> 
											</div>
											<div class="col-md-12 col-xs-12">										  
												<textarea class="form-control noresize" name="bContent"
													id="bContent" style="height: 140px;"></textarea>
											</div>
											<div class="col-md-12 col-xs-12" style="margin-top: 20px;">
												<div>
													<input 
														class="btn btn-success btn-lg pull-right" type="submit"
														value="문의하기" onclick="return bOnCheck()" >
												</div>
												<form action=" mCustomerInquiry" method="post">
													<input class="btn btn-success btn-lg pull-right" type="submit" value="목록보기">												
												</form>
											</div>

										</form>
									</div>
								</div>
								<!-- end of goodsDetail -->

								<div class="tab-pane fade" id="profile">
									<div class="col-md-12 col-xs-12">
										<h2>건의사항</h2>
									</div>
									<div class="col-md-12 col-xs-12">
										<h4 style="color: darkgray;">고객님의 의견을 적극 반영 하겠습니다!</h4>
									</div>
									<div class="container">
										<form id="form-customerSuggestion" action="suggestionInsert" method="post">
											<div class="col-md-12 col-xs-12">
												<h3>제목</h3>
											</div>
											<div class="col-md-12 col-xs-12">
												<input class="form-control input-sm" name="bTitle"
													id="bTitle">
											</div>
											<div class="col-md-12 col-xs-12">
												<h3>내용</h3>
											</div>
											<div class="col-md-12 col-xs-12">
												<textarea class="form-control noresize" name="bContent"
													id="bContent" style="height: 140px;"></textarea>
											</div>
											<div class="col-md-12 col-xs-12" style="margin-top: 20px;">
												<input 
													class="btn btn-success btn-lg pull-right" type="submit"
													value="문의하기">
											</div>
										</form>
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
	<script src="resources/custom/addJS/minifunction.js"></script>
	
</body>
<footer>
	<div class="article">
		<jsp:include page="../footer.jsp" />
	</div>
</footer>
</html>