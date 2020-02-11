<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문조회 | Catpple</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="resources/custom/addCSS/myroom.css">
<link rel="stylesheet" href="resources/custom/addCSS/footer.css">
<link rel="stylesheet" href="resources/custom/addCSS/star-rating.css">
<link rel="stylesheet" href="resources/custom/addCSS/checkbox.css">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean"
	rel="stylesheet">
<style>
#first-row, #second-row {
	font-weight: bold;
	color: crimson;
}
</style>
</head>
<body class="font-Jua">

	
	<div  class="col-md-12">
		<c:forEach var="oplist" items="${oplist}">
			<div class="col-md-12 col-xs-12"
				style="padding-right: 0px; padding-left: 0px;">
				<div class="col-md-3 col-xs-4"
					style="padding-left: 0px; padding-right: 0px;">
					<img src="resources/images/item1.jpg">
				</div>
				<div class="col-md-4 col-xs-8" style="padding-right: 0px;">${oplist.gName}</div>
				<div class="col-md-2 col-xs-8">${oplist.midPrice}</div>
				<div class="col-md-3 col-xs-8 text-center">
					판매자:${oplist.member_mId}
					<h6 style="color: lightgray;">(${oplist.mPhone})</h6>
				</div>
				<c:choose>
					<c:when test="${oplist.dState=='a'}">
						<div class="col-md-3"><font style="color:crimson;"> 배송준비 중</font></div>
					</c:when>
					<c:when test="${oplist.dState=='b'}">
						<div class="col-md-3"> <font style="color:#FF8C00;">배송 중</font></div>
					</c:when>
					<c:when test="${oplist.dState=='c'}">
						<div class="col-md-3"><font style="color:green;"> 배송 완료 </font></div>
					</c:when>
				</c:choose>
				<div class="col-md-6">송장번호: ${oplist.dNum}</div>
			</div>
	   </c:forEach>
	</div>
	
	<script src="resources/bootstrap/js/jquery-3.2.1.min.js"></script>
	<script src="resources/custom/addJS/minifunction.js"></script>
	<script src="resources/bootstrap/js/bootstrap.js"></script>
	<script src="resources/custom/addJS/myroom.js"></script>
</body>

</html>