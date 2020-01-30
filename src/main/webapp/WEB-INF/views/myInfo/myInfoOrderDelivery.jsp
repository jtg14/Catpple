<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
#first-row, #second-row {
	font-weight: bold;
	color: crimson;
}
</style>
</head>
<body>
	<div class="col-md-10 col-xs-12">
		<h4 style="text-align: center;">주문 /배송 조회</h4>
		<div class="col-md-12 col-xs-12"
			style="border: 2px solid crimson; border-radius: 10px; padding: 20px 10px; text-align: center;">
			<label style="width: 100%;">현재 적립예정포인트는 <b
				style="color: crimson;">900점</b>입니다. 상품 평가 완료시 포인트가 적립 됩니다.<br>
				주문 번호를 클릭하면 해당 주문 목록을 볼 수 있습니다.
			</label>
			<div class="col-md-12 col-xs-12"
				style="border-top: 1px solid darkgray; padding-left: 0px; padding-right: 0px;">
				<table class="table">
					<thead>
						<tr id="first-row">
							<td>주문일</td>
							<td>주문번호</td>
							<td>결재금액</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>2020.01.06</td>
							<td><a href="#" data-toggle="collapse" data-target="#demo">C20011578243517541</a></td>
							<td>1,200,000원</td>
						</tr>

					</tbody>
				</table>
				<div id="demo" class="collapse">
					<div class="col-md-12 col-xs-12"
						style="padding-right: 0px; padding-left: 0px;">
						<div class="col-md-3 col-xs-4"
							style="padding-left: 0px; padding-right: 0px;">
							<img src="resources/images/item1.jpg">
						</div>
						<div class="col-md-4 col-xs-8" style="padding-right: 0px;">메롱메롱메롱메롱메롱메롱메롱메롱메롱</div>
						<div class="col-md-2 col-xs-8">600,000원</div>
						<div class="col-md-3 col-xs-8 text-center">
							<h4>판매자</h4>
							<h6 style="color: lightgray;">(010-7777-7777)</h6>
						</div>
					</div>
					<div class="col-md-12 col-xs-12"
						style="padding-right: 0px; padding-left: 0px;">
						<div class="col-md-3 col-xs-4"
							style="padding-left: 0px; padding-right: 0px;">
							<img src="resources/images/item2.jpg">
						</div>
						<div class="col-md-4 col-xs-8" style="padding-right: 0px;">메롱메롱메롱메롱메롱메롱메롱메롱메롱</div>
						<div class="col-md-2 col-xs-8">600,000원</div>
						<div class="col-md-3 col-xs-8 text-center">
							<h4>판매자</h4>
							<h6 style="color: lightgray;">(010-7777-7777)</h6>
						</div>
					</div>
				</div>
			</div>
			<!--/border-top -->
			<div class="btn btn-warning" style="">구매후기</div>
		</div>
	</div>

</body>
</html>