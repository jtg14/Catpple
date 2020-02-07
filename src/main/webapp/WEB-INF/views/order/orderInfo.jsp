<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
<title>주문완료 | Catpple</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="resources/custom/addCSS/footer.css">
<link rel="stylesheet" href="resources/custom/addCSS/header.css">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">
<style>
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
	width: 80px;
}
</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="container ">
		<!-- 주문완료 -->
		<div class="col-md-6 col-xs-12">
			<div class="col-md-2 col-md-offset-1 col-xs-3 text-center">
				<img class="order-card" src="resources/images/order.png">
			</div>
			<div class="col-md-4 col-xs-9 text-center">
				<h1>주문결제</h1>
			</div>
		</div>
		<!-- 장바구니,주문/결제,주문종류 -->
		<div class="col-md-6 col-xs-12 text-center"
			style="padding-right: 0px; padding-left: 0px;">
			<h3 class="h3">
				<span>장바구니</span> > <span class="current-status">주문/결제</span> > <span>주문완료</span>
			</h3>
		</div>
	</div>
	<!-- 경계선 -->
	<span id="course-divider"><hr></span>
	<!-- 결제 정보 단위 -->
	<div class="container">
		<div class="col-md-6 col-xs-12">
			<h4 class="h4">주문상품 확인 및 할인적용</h4>
		</div>
		<div class="col-md-4 col-xs-12">
			<h5 class="h5 text-right">*상품수량 및 옵션변경은 장바구니에서 가능합니다.</h5>
		</div>
		<div class="col-md-2 col-xs-12 text-center">
			<button class="btn btn-default" style="margin-left: 20;"
				type="button" onclick="javascript:history.back(1)">이전 페이지</button>
		</div>
	</div>
	<div class="container order-item">
		<!-- 상품 옵션정보-->
		<div class="col-md-6 col-xs-12"
			style="margin-left: 0px; margin-right: 0px; padding-left: 0px; padding-right: 0px;">
			<table class="table">
				<thead class="thead">
					<tr>
						<th>상품/옵션정보</th>
						<th>수량</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="list" items="${list}">
					<tr>
						<td>${list.gname}</td>
						<td>${list.cAmount}</td>
					</tr>
				</c:forEach>	
				</tbody>
			</table>
		</div>
		<!--수량 ,상품금액,할인금액,할인적용금액 -->
		<div class="col-md-6 col-xs-12 text-center"
			style="margin-left: 0px; margin-right: 0px; padding-left: 0px; padding-right: 0px;">
			<table class="table">
				<thead>
					<tr>
						<th>상품금액</th>
						<th>할인금액</th>
						<th>할인적용금액</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${list}">
					<tr>
						<td><fmt:formatNumber value="${list.gprice * list.cAmount}" pattern="#,###" />원</td>
						<td>(-)0원</td>
						<td><fmt:formatNumber value="${list.gprice * list.cAmount}" pattern="#,###" />원</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<!-- 주문확인 단위 -->
	<div class="container"
		style="border: 5px solid crimson; border-radius: 10px; padding: 20px;">
		<!-- price -->
		<div class="col-md-4 col-xs-12 div-bgcolor-lightgray">
			<div class="col-xs-6 text-left" style="padding-top: 5px;">주문금액</div>
			<div class="col-xs-6 text-right"
				style="padding-right: 0px; padding-left: 0px;">
				<span class="h3">690,000</span>원
			</div>
		</div>
		<!-- discount -->
		<div class="col-md-4 col-xs-12 div-bgcolor-lightgray">
			<div class="col-xs-6 text-left" style="padding-top: 5px;">할인사용금액</div>
			<div class="col-xs-6 text-right"
				style="padding-right: 0px; padding-left: 0px;">
				(-)<span class="h3">0</span>원
			</div>
		</div>
		<!-- total -->
		<div class="col-md-4 col-xs-12 div-bgcolor-lightgray">
			<div class="col-xs-6 text-left" style="padding-top: 5px;">최종결제금액</div>
			<div class="col-xs-6 text-right"
				style="padding-right: 0px; padding-left: 0px;">
				<span class="h3">690,000</span>원
			</div>
		</div>
		<!-- 추가 할인 및 포인트적용 -->
		<form role="form" id="order-form">
			<div class="col-md-6 col-xs-12 text-center"
				style="padding-top: 15px; padding-bottom: 20px;">
				<div class="col-md-3 col-xs-6" style="margin-top: 5px;">포인트사용</div>
				<div class="col-md-4 col-xs-6">
					<input class="form-control text-cente input-sm"
						style="width: 100; display: inline-block" type="number">
				</div>
				<div class="col-md-5 col-xs-12" style="margin-top: 5px;">
					보유포인트 : <span>99,999</span>원
				</div>
			</div>
			<div class="container" style="padding-right: 0px; padding-left: 0px;">
				<div class="col-md-12 col-xs-12 text-center">
					<div class="col-md-2 col-xs-12">
						<span class="h3">배송지선택</span>
					</div>
					<div class="col-md-2 col-xs-6">
						<label> <input type="radio" id="q128" name="quality[21]"
							value="1" /> 기본배송지
						</label>
					</div>
					<div class="col-md-2 col-xs-6">
						<label> <input type="radio" id="q129" name="quality[21]"
							checked="checked" value="2" /> 직접입력
						</label>
					</div>
				</div>
				<div class="container">
					<div class="col-md-10 col-xs-12">
						<table class="table">
							<tbody>
								<tr>
									<td class="table-head">받으시는분</td>
									<td><input type="text" class="form-control input-sm"
										style="width: 100;"></td>
								</tr>
								<tr>
									<td class="table-head">주소</td>
									<td>
										<div class="col-md-2 col-xs-6" style="padding-left: 0px;">
											<input type="text" class="form-control input-sm"
												style="margin-bottom: 8px;">
										</div>
										<div class="col-md-10 col-xs-6" style="margin-bottom: 8px;">
											<button class="btn btn-sm">주소 찾기</button>
										</div>
										<div class="col-md-7 col-xs-12" style="padding-left: 0px;">
											<input type="text" class="form-control input-sm"
												style="margin-bottom: 8px;">
										</div>
										<div class="col-md-7 col-xs-12" style="padding-left: 0px;">
											<input type="text" class="form-control input-sm">
										</div>
									</td>
								</tr>
								<tr>
									<td>휴대전화</td>
									<td>
										<div class="col-md-4 col-xs-12" style="padding-left: 0px;">
											<input type="text" class="form-control input-sm"
												placeholder="휴대폰 번호">
										</div>
									</td>
								</tr>
								<tr>
									<td>배송메모</td>
									<td>
										<div class="col-md-8 col-xs-12" style="padding-left: 0px;">
											<input type="text" class="form-control input-sm">
										</div>
										<div class="col-md-2 col-xs-12">
											0/50<span>최대 50자</span>
										</div>
									</td>
								</tr>
								<tr>
									<td>주문자</td>
									<td>
										<div class="col-md-3 col-xs-12 text-center">전태구</div>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="panel-group" id="accordion" role="tablist"
							aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<h4 class="panel-title">
										<input type="checkbox"> <a data-toggle="collapse"
											data-parent="#accordion" href="#collapseOne"
											aria-expanded="true" aria-controls="collapseOne">개인정보 판매자
											제공에 동의 합니다.</a>
									</h4>
								</div>
								<div id="collapseOne" class="panel-collapse collapse in"
									role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">고객님께서는 아래 내용에 대하여 동의를 거부하실 수 있으며,
										거부시 상품 배송, CS가 제한됩니다.</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingTwo">
									<h4 class="panel-title">
										<input type="checkbox"> <a class="collapsed"
											data-toggle="collapse" data-parent="#accordion"
											href="#collapseTwo" aria-expanded="false"
											aria-controls="collapseTwo"> 개인정보 수집 및 이용에 동의 합니다. </a>
									</h4>
								</div>
								<div id="collapseTwo" class="panel-collapse collapse"
									role="tabpanel" aria-labelledby="headingTwo">
									<div class="panel-body">고객님께서는 아래 내용에 대하여 동의를 거부하실 수 있으며,
										거부 시 상품배송, 구매 및 결제, 일부 포인트 적립이 제한됩니다. 수집이용목적 수집 항목 보유기간 대금
										결제/환불 서비스 제공, 주문/배송/거래 내역 조회 서비스 제공, 전자상거래법 준수 등 신용카드 정보, 계좌
										정보, 주문/배송/거래 내역 회원탈퇴 시 까지 단, 관계 법령의 규정에 따라 보존할 의무가 있으면 해당 기간
										동안 보존 상품 및 경품(포인트, 쿠폰 포함) 배송(반품/환불/취소등), 배송지 확인, 최초 입력 후 불러오기
										기능 제공 아이디, 배송지 정보 (수령인,전화번호,주소), 현관비밀번호(입력시) 회원탈퇴 시 까지 단, 관계
										법령의 규정에 따라 보존할 의무가 있으면 해당 기간 동안 보존 이용계약(이용약관)이 존속중인 탈퇴하지 않은
										회원의 경우 보유기간은 보존의무기간 이상 보관할 수 있으며 이 기간이 경과된 기록에 대해서 파기요청이 있는 경우
										파기함 결제수단에 따른 개인정보 수집.이용 항목이 상이할 수 있음</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingThree">
									<h4 class="panel-title">
										<input type="checkbox"> <a class="collapsed"
											data-toggle="collapse" data-parent="#accordion"
											href="#collapseThree" aria-expanded="false"
											aria-controls="collapseThree"> 주문 상품 정보에 동의</a>
									</h4>
								</div>
								<div id="collapseThree" class="panel-collapse collapse"
									role="tabpanel" aria-labelledby="headingThree">
									<div class="panel-body">
									주문 상품의 상품명, 가격, 배송정보에 동의합니다.
									</div>
								</div>
							</div>
						</div><!-- 이용동의 탭  -->
						<div class="col-md-12 col-xs-12">
							<h4><input type="checkbox"><span style="margin-left:20px;">위 내용을  확인 했으며 모든 내용에 동의 합니다</span></h4>
						</div>
						<div class="col-md-6 col-xs-6 text-right">
						<button type="button" class="btn btn-danger">구매하기</button>
						</div>
						<div class="col-md-6 col-xs-6">
						<button type="button" class="btn btn-default">취소하기</button>
						</div>
					</div>
				</div>
			</div>

		</form>
	</div>

	
	<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="resources/bootstrap/js/bootstrap.min.js"></script>
	<div class="article">
		<jsp:include page="../footer.jsp"></jsp:include>
	</div>
</body>
</html>
g
