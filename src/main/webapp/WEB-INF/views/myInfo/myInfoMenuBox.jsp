<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>myInfoMenuBox</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<style type="text/css">
.myInfo-box {
	width: 200px;
	border: thin;
	border-style: solid;
	border-color: lightgray;
	border-radius: 10px;
	box-sizing: border-box;
}

.myInfo-sub-menu {
	color: black;
	text-decoration: none;
	
}
.myInfo-sub-menu:hover {
	color: red;
	text-decoration: none;
}
</style>
</head>
<body>
	<div class="container">
		<div class="myInfo-box" align="left">
			<div class="media">
				<div class="align-self-center" style="margin-left: 10px;">
					<img src="resources/img/rankSilver.jpg">
				</div>
			
				<div class="media-body" style="margin-left: 15px;">
					사과님은<br>
					실버<br>
					등급입니다.<br>
					<a href="#" class="btn btn-sm" style="background-color: orange; color: white;">회원혜택보기</a>
				</div>
			<div>
			</div>
			
			
			</div>
			<div style="background-color: lightgray;">
				<dl>
					<dd><a href="myInfoPoint" class="myInfo-sub-menu">포인트</a></dd>
					<dd><a href="myInfoExpectedPoints" class="myInfo-sub-menu">적립예정포인트</a></dd>
				</dl>
			</div>
			
			<!-- 내 지갑 -->
			<div class="media">
			<i class="material-icons" style="font-size:36px;">account_box</i>
			<dl>
				<dd></dd>
				<dt style="font-size: large;">내 지갑</dt>
				<dd></dd>
				<dd><a href="myInfoPoint" class="myInfo-sub-menu">포인트</a></dd>
				<dd><a href="myInfoExpectedPoints" class="myInfo-sub-menu">적립예정포인트</a></dd>
			</dl>
			</div>
			
			<!-- 주문/배송 -->
			<div class="media">
			<i class="material-icons" style="font-size:36px;">add_shopping_cart</i>
			<dl>
				<dd></dd>
				<dt style="font-size: large;">주문/배송</dt>
				<dd></dd>
				<dd><a href="myInfoOrderDelivery" class="myInfo-sub-menu">주문/배송조회</a></dd>
				<dd><a href="myInfoOrderCancel" class="myInfo-sub-menu">주문취소</a></dd>
				<dd><a href="myInfoReturnExchange" class="myInfo-sub-menu">반품/교환</a></dd>
				<dd><a href="myInfoCart" class="myInfo-sub-menu">찜리스트</a></dd>
			</dl>
			</div>
			
			<!-- 고객센터 -->
			<div class="media">
			<i class="material-icons" style="font-size:36px;">headset_mic</i>
			<dl>
				<dd></dd>
				<dt style="font-size: large;">고객센터</dt>
				<dd></dd>
				<dd><a href="myInfoCustomerInquiry" class="myInfo-sub-menu">1:1문의</a></dd>
				<dd><a href="myInfoFAQ" class="myInfo-sub-menu">FAQ</a></dd>
				<dd><a href="myInfoNotice" class="myInfo-sub-menu">공지사항</a></dd>
			</dl>
			</div>
			
			<!-- 내 정보 -->
			<div class="media">
			<i class="material-icons" style="font-size:36px;">settings</i>
			<dl>
				<dd></dd>
				<dt style="font-size: large;">내 정보</dt>
				<dd></dd>
				<dd><a href="myInfoChange" class="myInfo-sub-menu">내정보 변경</a></dd>
				<dd><a href="myInfoWithdrawal" class="myInfo-sub-menu">회원탈퇴</a></dd>
			</dl>
			</div>
		</div>
	</div>
</body>
</html>