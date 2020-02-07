<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.css">
<title>비밀번호 변경</title>
<link
	href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean"
	rel="stylesheet" />
</head>
<body style="font-family: Jua;">
	<div class="container"
		style="padding-left: 40px; padding-right: 40px; padding-top: 40px;">
		<div class="col-md-offset-4 col-md-4 col-xs-12"
			style="border: 5px solid crimson; border-radius: 10px; padding: 20px;">
			<div id="pwChangeForm" class=" col-md-12 col-xs-12 text-center">
				<h3>비밀번호 변경</h3>
					<div class="col-md-12 col-xs-12 text-center">
						<input id="passwordChange" class="form-control input-sm" type="password"
							placeholder="변경할 비밀번호">
						<input id="cpasswordChange" class="form-control input-sm" type="password"
							placeholder="비밀번호 확인" style="margin-top: 5px;">
					</div>
					<div class="col-md-12 col-xs-12 text-center"
						style="margin-top: 10px;">
						<a class="btn btn-success btn-block" type="button"
							style="padding-left: 0px; padding-right: 0px;" onclick="confirmA('${logInUser.mId}')">비밀번호 변경 </a>
					</div>
			</div>
		</div>
	</div>
	<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.js"></script>
	<script
		src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
	<script src="resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/custom/addJS/minifunction.js"></script>
</body>
</html>