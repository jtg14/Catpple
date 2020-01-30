<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>myInfoCart</title>
<style>
@media ( max-width : 768px) {
	.first-div {
		border-top: 1px solid lightgray;
	}
}
</style>
</head>
<body>

	<div class="col-md-10 col-xs-12">
		<h2 style="color: crimson">장바구니</h2>
		<%-- <c:forEach begin="1" end="5"> --%>
			<div class="container text-center"
				style="border-top: 2px solid lightgray; padding-top: 10px; padding-bottom: 10px;">
				<div class="col-md-6 col-xs-12"
					style="padding-top: 0px; padding-bottom: 0px; padding-right: 0px; padding-left: 0px;">
					<div class="col-md-6 col-xs-3" style="padding-left: 0px;">
						 <img class="img" src="resources/images/item3.jpg" />
					</div>
					<div class="col-md-6 col-xs-9"
						style="padding-top: 4%; padding-right: 0px;">
						<h4>프로베스트 캣 밸런스 15kg</h4>
						<label style="font-size: x-small;">재고 있음</label>
						<label for="primary" class="btn btn-primary">선택 <input type="checkbox" id="primary" class="badgebox" checked="checked"><span class="badge">&check;</span></label>
					</div>


				</div>
				<div class="col-md-6 col-xs-12 first-div" style="padding-top: 5%">
					<div class="col-md-3 col-xs-3">
						<span>10000원</span>
					</div>
					<div class="col-md-9 col-xs-9">
						<span>수량 <input class="form-group input-sm" type="number"
							style="width: 60px; margin-bottom: 5px;"></span> <a
							class="pull-right">삭제</a>
					</div>
					<div class="col-md-3 col-md-offset-6 col-xs-2 col-xs-offset-3">
						<button id="amount"
							class="btn btn-primary btn-xs amount_modification">수정</button>
					</div>
				</div>
			</div>
		<%-- </c:forEach> --%>

	</div>
	<div class="col-md-2 col-md-offset-8 col-xs-4 col-xs-offset-4"
		style="margin-top: 20px;">
		<button class="btn btn-lg btn-danger">구매하기</button>
	</div>
</body>
</html>