<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/custom/addCSS/star-rating.css">
<title>myInfoExpectedPoints</title>
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

@media ( max-width : 968px) {
	#sel {
		font-size: 1em;
	}
}
.detail{
	border-top:2px solid lightgray;
}
</style>
</head>
<body>
	<div class="container">
		<h2>1:1 문의</h2>
		<form id="form-CustomerInquiry">
			<div class="col-md-12 col-xs-12 detail">
				<h4 style="line-height: 1.5;">
					<span class="label label-success" style="margin-right: 10px;">답변완료</span>물건을
					받았는데 파손 되어 있습니다.
				</h4>
			</div>
			<div class="col-md-1 col-xs-3">
				<h3 style="margin-top: 0px;">분류</h3>
			</div>
			<div class="col-md-4 col-xs-4">
				<h4>[구매관련]</h4>
			</div>
			<div class="col-md-12 col-xs-12 detail"
				style="min-height: 250px; font-size: 1.2em;max-height:400px;overflow:auto;padding-top:15px;">
				<c:forEach begin="1" end="30">
				얼마전에 고양이 장난감을 샀는데 손잡이부분이 깨져서 왔습니다.
				얼마전에 고양이 장난감을 샀는데 손잡이부분이 깨져서 왔습니다.
				</c:forEach>
				</div>
			<div class="col-md-12 col-xs-12 text-center detail"
				style="margin-top: 20px;max-height:350px;overflow:auto;">
				<img src="resources/images/noBoard.png">
			</div>
<!-- fffff -->
		</form>
	</div>
</body>
</html>