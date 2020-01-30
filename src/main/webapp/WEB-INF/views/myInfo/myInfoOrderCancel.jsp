<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
th, td {
	text-align: center;
}

@media (max-width : 768px) {
	  .hide-div{
	  width:0px;
	  height:0px;
	  font-size:0px;
	  }
	}
</style>
</head>
<body>
	<div class="col-md-10 col-xs-12 text-center">
		<div class="col-md-2 col-xs-12"><span class="h1" style="color:crimson">주문취소</span></div>
		<div class="col-md-4  col-xs-12 "style="padding:0px;"><span class="h4" style="color:darkgray">(주문번호를 클릭하면 주문서를 볼수있어요 !)</span></div>
		<div class="col-md-12 col-xs-12" style="padding:0;">	
			<div class="col-md-2 col-xs-4">
			주문일
			</div>
			<div class="col-md-4 col-xs-5">
			주문번호
			</div>
			<div class="col-md-2 col-xs-3">
			결재금액
			</div>
			<div class="col-md-2 hide-div">
			주문상태
			</div>
			<div class="col-md-2 hide-div">
			결제수단
			</div>
		</div>
		<c:forEach begin="1" end="5">
		<div class="col-md-12 col-xs-12" style="padding:10px 0px; border-top:1px solid lightgray;">	
			<div class="col-md-2 col-xs-4">
			2020.01.06
			</div>
			<div class="col-md-4 col-xs-5">
			C20200125A001
			</div>
			<div class="col-md-2 col-xs-3">
			31,300
			</div>
			<div class="col-md-2 hide-div">
			발송처리완료
			</div>
			<div class="col-md-2 hide-div">
			신용카드
			</div>
		</div>
		</c:forEach>
	</div>
</body>
</html>