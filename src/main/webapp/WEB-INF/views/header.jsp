<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="resources/custom/addCSS/header.css">
<link
	href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean"
	rel="stylesheet">

</head>
<body class="font-Jua">
	<nav class="navbar navbar-default"
		style="background-color: white; margin-bottom: 0;">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed custom-toggle"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-2"
					aria-expanded="false"
					style="margin-top: 10px; margin-bottom: 10px;">
					<span class="sr-only">Toggle navigation</span> 접속
				</button>
				<div class="navbar-header">
					<a class="navbar-brand logo" style="margin-top: 5px;" href="home">
						<img alt="로고자리" src="...">
					</a>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-2">
				<ul class="nav navbar-nav navbar-right">
				<c:if test="${logInUser eq null}">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">계정관리
							 <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu" style="width:100px;left:91%;top:50px;">
							<li><a href="logInf">로그인</a></li>
							<li><a href="signupf">회원가입</a></li>
						</ul></li>
						</c:if>
						<c:if test="${logInUser ne null}">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">나의 메뉴
							<span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu" style="width:250px;left:87%;top:50px;">
							<li><a href="mroom"><span class="user-status" style="margin-lift:10px;">●</span><strong
									style="margin-left: 20px;">${logInUser.mName}</strong>&nbsp;님 (마이룸)</a></li>
							<li><a href="mCart">장바구니<span class="badge"
									style="margin-left:10px;">99 +</span></a></li>
							<li><a href="logOut">로그아웃</a></li>
						</ul></li>
						</c:if>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
	</nav>
	<nav class="navbar navbar-default"
		style="border-top-width: 0px; border-right-width: 0px; border-left-width: 0px;">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header custom">
				<button type="button" class="navbar-toggle collapsed custom-toggle"
					style="margin-bottom: 0px; margin-top: 20px;"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1" style="padding-top: 20px;">
				<ul class="nav navbar-nav navbar-left custom-nav">
					<li class="dropdown"><a href="#"
						class="dropdown-toggle main-menu" style="text-align: center;"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false"> 모든상품 </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<div class="container">
								<div class="row">
									<div class="col col-xs-6 col-md-3">
										<ul class="nav flex-column">
											<li class="nav-item"><span
												class="nav-link text-bold first-class"><a href="gSResult?search=사료">사료</a></span></li>
											<li class="nav-item"><a
												class="nav-link active second-class" href="gSResult?search=고양이처방식">고양이처방식</a></li>
											<li class="nav-item"><a class="nav-link second-class"
												href="gSResult?search=노묘용">노묘용</a></li>
											<li class="nav-item"><a class="nav-link second-class"
												href="gSResult?search=성묘용">성묘용</a></li>
											<li class="nav-item"><a class="nav-link second-class"
												href="gSResult?search=자묘용">자묘용</a></li>
											<li class="nav-item"><a class="nav-link second-class"
												href="gSResult?search=전연령">전연령용</a></li>
										</ul>
									</div>
									<!-- /.col  -->

									<div class="col col-xs-6 col-md-3">
										<ul class="nav flex-column">
											<li class="nav-item"><span
												class="nav-link text-bold first-class"><a href="gSResult?search=캔">캔,간식</a></span></li>
											<li class="nav-item"><a
												class="nav-link active second-class" href="gSResult?search=간식">간식캔</a></li>
											<li class="nav-item"><a class="nav-link second-class"
												href="gSResult?search=주식캔">주식캔</a></li>
											<li class="nav-item"><a class="nav-link second-class"
												href="gSResult?search=스낵">스낵</a></li>
											<li class="nav-item"><a class="nav-link second-class"
												href="gSResult?search=건조간식">건조간식</a></li>
											<li class="nav-item"><a class="nav-link second-class"
												href="gSResult?search=통살">통살</a></li>
										</ul>
									</div>
									<!-- /.col  -->

									<div class="col col-xs-6 col-md-3">
										<ul class="nav flex-column">
											<li class="nav-item"><span
												class="nav-link text-bold first-class"><a href="gSResult?search=장난감">장난감</a></span></li>
											<li class="nav-item"><a
												class="nav-link active second-class" href="#">낙싯대</a></li>
											<li class="nav-item"><a class="nav-link second-class"
												href="gSResult?search=막대">막대</a></li>
											<li class="nav-item"><a class="nav-link second-class"
												href="gSResult?search=인형/쿠션">인형/쿠션</a></li>
											<li class="nav-item"><a class="nav-link second-class"
												href="gSResult?search=공">공</a></li>
											<li class="nav-item"><a class="nav-link second-class"
												href="gSResult?search=박스/하우스">박스/하우스</a></li>
										</ul>
									</div>
									<!-- /.col  -->


									<div class="col col-xs-6 col-md-3">
										<ul class="nav flex-column">
											<li class="nav-item"><span
												class="nav-link text-bold first-class"><a href="gSResult?search=화장실">화장실/매트</a></span></li>
											<li class="nav-item"><a
												class="nav-link active second-class" href="#">하우스화장실</a></li>
											<li class="nav-item"><a class="nav-link second-class"
												href="gSResult?search=평판화장실">평판화장실</a></li>
											<li class="nav-item"><a class="nav-link second-class"
												href="gSResult?search=화장실매트">화장실매트</a></li>
											<li class="nav-item"><a class="nav-link second-class"
												href="gSResult?search=거름망">거름망</a></li>
											<li class="nav-item"><a class="nav-link second-class"
												href="gSResult?search=배변패드">배변패드</a></li>
										</ul>
									</div>
									<!-- /.col  -->


								</div>
							</div>
							<!--  /.container  -->


						</div></li>
				</ul>

				<ul class="nav navbar-nav navbar-center custom-nav">
					<form class="navbar-form" method="post" action="gSResult" style="margin-top: 0px; margin-left: 0px; margin-right: 0px;">
						<div class="form-group">
							<input type="text" name="search" class="form-control input-lg"
								placeholder="원하시는 상품명"
								style="border-top-width: 3px; border-right-width: 3px; border-bottom-width: 3px; border-left-width: 3px; border-color: crimson;">
						</div>
						<div class="form-group">
							<button type="submit" class="btn btn-danger btn-lg"
								style="width: 100%">검색</button>
						</div>
					</form>
				</ul>
				<ul class="nav navbar-nav navbar-right custom-nav">
					<li class="dropdown"><a href="#"
						class="dropdown-toggle main-menu"
						style="text-align: center; height: 65px;" data-toggle="dropdown"
						role="button" aria-haspopup="true" aria-expanded="false">모든메뉴
					</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<div class="container">
								<div class="row">
									<div class="col col-xs-6 col-md-3">
										<ul class="nav flex-column">
											<li class="nav-item"><span
												class="nav-link text-bold first-class">대분류 1</span></li>
											<li class="nav-item"><a
												class="nav-link active second-class" href=" ginfo">상세페이지</a></li>
											<li class="nav-item"><a class="nav-link second-class"
												href="osuccess">주문완료</a></li>
											<li class="nav-item"><a class="nav-link second-class"
												href="oinfo">결제정보</a></li>
										</ul>
									</div>
									<!-- /.col  -->

									<div class="col col-xs-6 col-md-3">
										<ul class="nav flex-column">
											<li class="nav-item"><span
												class="nav-link text-bold first-class">대분류 2</span></li>
											<li class="nav-item"><a
												class="nav-link active second-class" href="header">헤더</a></li>
											<li class="nav-item"><a class="nav-link second-class"
												href="mroom">마이룸</a></li>
											<li class="nav-item"><a class="nav-link second-class"
												href="gsearch">검색페이지</a></li>
										</ul>
									</div>
									<!-- /.col  -->

									<div class="col col-xs-6 col-md-3">
										<ul class="nav flex-column">
											<li class="nav-item"><span
												class="nav-link text-bold first-class">대분류 3</span></li>
											<li class="nav-item"><a
												class="nav-link active second-class" href="#">소분류3-1</a></li>
											<li class="nav-item"><a class="nav-link second-class"
												href="#">소분류 3-2</a></li>
											<li class="nav-item"><a class="nav-link second-class"
												href="#">소분류 3-3</a></li>
										</ul>
									</div>
									<!-- /.col  -->


									<div class="col col-xs-6 col-md-3">
										<ul class="nav flex-column">
											<li class="nav-item"><span
												class="nav-link text-bold first-class">대분류 4</span></li>
											<li class="nav-item"><a
												class="nav-link active second-class" href="#">소분류 4-1</a></li>
											<li class="nav-item"><a class="nav-link second-class"
												href="#">소분류 4-2</a></li>
											<li class="nav-item"><a class="nav-link second-class"
												href="#">소분류 4-3</a></li>
										</ul>
									</div>
									<!-- /.col  -->


								</div>
							</div>
							<!--  /.container  -->


						</div></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
</body>
</html>
