<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 | Catpple</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="resources/custom/addCSS/footer.css">
<link rel="stylesheet" href="resources/custom/addCSS/goodsInfo.css">
<link rel="stylesheet" href="resources/custom/addCSS/header.css">
<link
	href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean"
	rel="stylesheet">
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
	width: 28%;
}

@media ( max-width : 768px) {
	.first-div {
		border-top: 1px solid lightgray;
	}
	.loginbtn {
		width: 120px;
	}
}

@media ( min-width : 968px) {
	.loginbtn {
		width: 130px;
	}
}
</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="container" style="min-height: 500px; margin-top: 5%;">
		<h1 class="text-center">로그인</h1>
		<!-- 로그인기능 구현 했읍니다~ -->
		<div class="col-md-offset-4 col-md-4 col-xs-12 text-center">
			<div class="container col-md-12"
				style="border: 5px solid crimson; border-radius: 10px; padding: 20px;">
					<div class="col-md-12 col-xs-12 text-center">
						<input class="form-control input-sm" type="text" placeholder="아이디" name="id" id="id" style="font-size:1.2em;">
						<input class="form-control input-sm" type="password" name="password" id="password" style="font-size:1.2em;"
							placeholder="비밀번호" style="margin-top: 5px;">
					</div>
					<div class="col-md-6 col-xs-6 text-center"
						style="margin-top: 10px;">
						<button class="btn loginbtn" type="submit"
							style="height: 80px; padding-left: 0px; padding-right: 0px;" onclick="logInCheck()">로그인</button>
					</div>
				<div class="col-md-6 col-xs-6 text-center"
					style="margin-top: 10px; padding-left: 0px; padding-right: 0px;">
					<div class="col-md-12 col-xs-12" style="margin-bottom: 10px;">
						<a type="button" class="btn btn-default btn-block" href="signupf">회원가입</a>
					</div>
					<div class="col-md-12 col-xs-12">
						<a type="button" class="btn btn-default btn-block" href="sIAP">ID/PW
							찾기</a>
					</div>
				</div>
			</div>
			<c:if test="${fail=='needLogin'}">
					<script>alert('세션이 만료되어 로그아웃 되었습니다.');</script>
				</c:if>
		</div>
	</div>

	<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.js"></script>
	<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
	<script src="resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/custom/addJS/minifunction.js"></script>
	<div class="article">
		<jsp:include page="../footer.jsp"></jsp:include>
	</div>
</body>
</html>