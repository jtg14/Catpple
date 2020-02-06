<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>제품 상세 | The Cat House</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="resources/custom/addCSS/footer.css">
<link rel="stylesheet" href="resources/custom/addCSS/goodsInfo.css">
<link rel="stylesheet" href="resources/custom/addCSS/header.css">
<link
	href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean"
	rel="stylesheet">
</head>
<body class="font-Jua">
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="container">
		<div class="jumbotron"
			style="border: 5px solid crimson; border-radius: 10px; background-color: white;">
				<div class="row">
					<div class="thumbnail col-md-4 col-xs-12">
						<img class="goods_image"
							src="resources/sellerInfo/${goods.member_mid}/${goods.gimg1}">
					</div>
					<div class="col-md-8 col-xs-12">
						<div class="col-md-12 col-xs-12">
							<h3>
								<span class="brand_ame">${goods.company}</span> <span
									class="item_Name"> ${goods.gname} </span>
							</h3>
						</div>
						<div class="col-md-12 col-xs-12">
							<span>구매 0</span> <span class="divider">|</span> <span id="stock">(남은수량${goods.gstock}
								개)</span>
						</div>
						<div class="col-md-12 col-xs-6" style="margin-top: 40px;">
							<strong class="discount-persentage">0<span>% Off</span></strong>
							<div class="price_inner">
								<del>
									<span class="before-price">${goods.gprice}</span><span
										class="before-price">원</span>
								</del>
								<strong id="price">${goods.gprice}</strong><strong><span>원</span></strong>
							</div>
						</div>

						<div class="col-md-3 col-xs-6" style="margin-top: 60px;">
							<div class="input-group">
								<span class="input-group-btn">
									<button class="btn btn-default" type="button" id="btn-minus">-</button>
								</span> <input type="text" class="form-control amount_bar"
									maxlength="4" value="1" numberOnly id="amount1">
									<span class="input-group-btn">
									<button class="btn btn-default" type="button" id="btn-plus">+</button>
								</span>
							</div>
						</div>


					</div>
					<!-- end of row -->

					<div class="row">
						<div class="container"
							style="border-bottom: 2px; border-color: crimson;">
							<div class="col-lg-12" style="text-align: center;">
								<div class="col-md-3 col-xs-12">
									<h1>총 금액</h1>
								</div>
								<div class="col-md-9 col-xs-12">
									<h1 class="text-right" id="total">
										<fmt:formatNumber value="${goods.gprice}" pattern="#,###" />
										원
									</h1>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 col-xs-12">
							<div class="col-md-2 col-md-offset-4 col-xs-6">
								<button type="submit" class="btn btn-danger btn-lg pull-right"
									style="font-size: 1.4em;"
									onclick="purchase('${logInUser.mGrade}')">구매하기</button>
							</div>
			
							<div class="col-md-2 col-xs-6">
								<a class="btn btn-danger btn-lg"
									style="font-size: 1.4em;"
									type="button"
									onclick="goCart('${logInUser.mGrade}','${logInUser.mId}','${goods.gnum}')">장바구니</a>
							</div>
						</div>
					</div>
					<!-- end of row-2 -->
				</div>
			<!-- end of jumbotron -->
			<div class="tabs-container-style-1">
				<div class="col-md-12 col-xs-12"
					style="margin-top: 20px; margin-bottom: 20px;">
					<ul id="myTab" class="nav nav-tabs nav-justified"
						style="font-size: 2em;">
						<li class="active"><a href="#home" data-toggle="tab">상품
								상세</a></li>
						<li class=""><a href="#profile" data-toggle="tab">반품/교환</a></li>
						<li class=""><a href="#change" data-toggle="tab">배송</a></li>
					</ul>
				</div>
				<div id="myTabContent" class="tab-content container">

					<div class="tab-pane fade active in" id="home">
						<img class="img-responsive col-md-12" src="resources/sellerInfo/${goods.member_mid}/${goods.gimg2}">
					</div>
					<!-- end of goodsDetail -->

					<div class="tab-pane fade" id="profile">
						<p>1. 반품/교환은 주문 오류 또는 단순 변심일 경우 상품 수령일로부터 7일 이내 가능합니다.</p>
						<p>2. 상품이 표시내용과 다르거나 불량일 경우 상품 수령일로부터 3개월, 이상 확인을 한날로부터 30일까지
							가능합니다.</p>
						<p>3. 주문하신 상품과 다른 상품이 배송되었거나 파손된 경우 반품처리 후 교환이 가능합니다.</p>
						<p>4. 오발송 및 파손된 상품에 대한 내용은 1:1 문의 또는 위탁물류업체로 문의 주시기 바랍니다.</p>
						<p>
							<strong>[위탁물류업체 연락처: 070-9999-9999&nbsp;]</strong>
						</p>
						<p>
							<strong>[<span class="Apple-converted-space">&nbsp;</span>반품
								주소:&nbsp;경기도 성남시 돌마로
							</strong><strong>&nbsp;CJ 대한통운 ]</strong>
						</p>
						<p>&nbsp;</p>
					</div>
					<!-- end of change -->

					<div class="tab-pane fade" id="change">
						<p>1. 배송관련 : 월요일 ~ 금요일 오후 2시 이전 주문 및 입금완료분 당일 출고되며, 토,일 주문분은
							월요일에 일괄 발송됩니다.&nbsp;</p>
						<p>2. 도서, 산간지역 안내 : 도서산간 지역은 지역에 따른 추가배송료가 부가됩니다. (해당부분은 주문시
							유선으로 연락드립니다.)</p>
						<p>&nbsp;</p>

					</div>
					<!-- end of change -->
				</div>
			</div>
		</div>
	</div>
	<!-- end of container -->




	<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.js"></script>
	<script
		src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
	<script src="resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/custom/addJS/register.js"></script>
	<script src="resources/custom/addJS/minifunction.js"></script>
	<div class="article">
		<jsp:include page="../footer.jsp"></jsp:include>
	</div>
</body>
</html>
