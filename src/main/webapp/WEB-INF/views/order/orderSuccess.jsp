<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>주문완료 | Catpple</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/custom/addCSS/footer.css">
<link rel="stylesheet" href="resources/custom/addCSS/header.css">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">
<style>
#course-divider {
	left: 0;
	padding-top: 40px;
	top: 27px;
}

#course-divider hr {
	background-color: crimson;
	border: 2px solid crimson;
	border-radius: 7px 7px 7px 7px;
	height: 2px;
	width: 85%;
}

.font-Jua {
	font-family: Jua;
}

.order-table th,.order-table td {
	border: 20px solid white;
}
.result-table th,.result-table td{
	color:white;
}
.table-head {
	width: 35%;
	vertical-align: top;
	text-align: center;
	border-left: 0px;
}

.order-thumbnail {
	width: 80;
	height: 80;
}
.result-tablebox{
 border: 8px solid crimson;
 border-radius: 2em;
 margin-top:20px;
}
.item-list{
 border: 8px solid crimson;
 border-radius: 2em;

}
/* width */
::-webkit-scrollbar {
  width: 5px;
}
/* Track */
::-webkit-scrollbar-track {
  border-radius: 10px;
}

/* Handle */
::-webkit-scrollbar-thumb {
  background: crimson;
  border-radius: 10px;
}
</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<span id="course-divider"><hr></span>
	<div class="container" style="padding-bottom: 100px;">
		<div class="col-sm-12 col-md-12">
			<div class="col-sm-12 col-md-12">
				<h1 style="margin-top: 30px; margin-bottom: 30px;">
					주문이 정상적으로 <span style="color: crimson;">완료</span> 되었습니다.
				</h1>
			</div>
			<div class="col-sm-12 col-md-8" style="padding-top: 90px;">
				<table class="order-table"style="width: 100%;">
					<tbody>
						<tr>
							<td class="table-head">배송지 정보</td>
							<td>031-712-7447<br>전태구<br>경기 성남시 분당구 구미동 7-2
								광천프라자 5층
							</td>
						</tr>
						<tr>
							<td class="table-head">배송 메모</td>
							<td>부재시 연락바랍니다.</td>
						</tr>
						<tr>
							<td class="table-head">결제 정보</td>
							<td>거래수단 : 신용카드<br> 카드사 : 국민카드<br> 결제번호 : A7792020<br>
								운송장 번호 : 213213412
							</td>
						</tr>
						<tr>
							<td class="table-head"></td>
							<td></td>
						</tr>
					</tbody>
				</table>
				<div class="col-md-12 col-sm12">
				<div class="panel panel-default">
				  <div class="panel-body text-center">
				    적립 예정 포인트
				  </div>
				  <div class="panel-footer text-right">(+)6,900P</div>
				</div>
				<div class="col-md-12 col-sm-12 text-center" style="margin-top:30;">
	            <button type="button" class="btn btn-primary btn-lg"style="font-size:1.4em;">쇼핑계속하기</button>
       			 </div>
				</div>
			</div>
			
			<div class="col-sm-12 col-md-4 ">
			<h2 class="text-center" style="color:crimson;">주문확인</h2>
			</div>
			<div class="col-sm-12 col-md-4 item-list"
				style="padding-right: 0px; padding-left: 0px; max-height: 350px; position: relative; overflow: auto;">
				<c:forEach begin="1" end="10">
					<div class="col-sm-12 col-md-4"
						style="padding-right: 0px; padding-left: 0px; width: 100%; margin-top: 20px; border-top: 1px solid lightgray; padding-top: 10px; padding-bottom: 10px; min-height: 100;">
						<div class="col-xs-3 col-md-3"
							style="padding-right: 0px; padding-left: 0px;">
							<img class="order-thumbnail" src="resources/images/stick1.jpg">
						</div>
						<div class="col-xs-9 col-md-9"
							style="padding-right: 0px; padding-left: 0px;">
							<p>더 홀리스틱 홍삼&국내산오리 5.2kg</p>
							<p>선택 - 기본(69,000원)</p>
							<p>상품금액 : 69,000원</p>
							<p>주문수량 : 1개</p>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="col-sm-12 col-md-4 result-tablebox"style="background-color:crimson;">
				<table class="result-table" style="width:100%;">
				<tbody>
					<tr><td>상품금액</td><td class="text-right">690,000원</td></tr>
					<tr><td>배송비</td><td class="text-right">(+)0원</td></tr>
					<tr><td>적립금 사용</td><td class="text-right">(-)0원</td></tr>
					<tr><td>할인금액</td><td class="text-right">(-)0원</td></tr>
					<tr><td>최종 결제금액</td><td class="text-right">690,000원</td></tr>
				</tbody>
				</table>
			</div>
		</div>
		
	</div>
	<div class="article">
		<jsp:include page="../footer.jsp"></jsp:include>
	</div>
	<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
