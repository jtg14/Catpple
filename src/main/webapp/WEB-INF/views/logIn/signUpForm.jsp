<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>회원 가입 | Catpple</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="resources/custom/addCSS/footer.css">
<link rel="stylesheet" href="resources/custom/addCSS/goodsInfo.css">
<link rel="stylesheet" href="resources/custom/addCSS/header.css">
<link rel="stylesheet" href="resources/custom/addCSS/checkbox.css">
<link
	href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean"
	rel="stylesheet">
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="container">
		<div class="col-md-6 col-md-offset-3 col-xs-12 catpple-container" style="padding-bottom:20px;">
			<div class="signup-form-container">
				<!-- form start -->
				<form role="form" id="register-form" action="signup" method="post">
					<div class="form-header">
						<h3 class="form-title">
							<i class="fa fa-user"></i> 회원가입
						</h3>
					</div>
					<div class="form-body">
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-addon">
									<span class="glyphicon glyphicon-sunglasses"></span>
								</div>
								<input type="text" class="form-control" style="width:60%;"
									placeholder="아이디" maxlength="16" id="id" name="id">
							<button class="btn btn-primary pull-right" id="idCheck">중복확인</button>	
							</div>
							<span class="help-block" id="error"></span>
						</div>
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-addon">
									<span class="glyphicon glyphicon-user"></span>
								</div>
								<input type="text" class="form-control"
									placeholder="이름" maxlength="14" id="name" name="name">
							</div>
							<span class="help-block" id="error"></span>
						</div>

						<div class="form-group">
							<div class="input-group">
								<div class="input-group-addon">
									<span class="glyphicon glyphicon-envelope"></span>
								</div>
								<input id="email" type="text" class="form-control"name="email"
									placeholder="이메일">
							</div>
							<span class="help-block" id="error"></span>
						</div>
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-addon">
									<span class="glyphicon glyphicon-earphone"></span>
								</div>
								<input id="phone" type="text" class="form-control"name="phone"
									placeholder="연락처 ( ' - ' 제외)" maxlength="13">
								<span class="input-group-btn">
									<button class="btn btn-default" type="button" id="phoneCheck">휴대폰인증</button>
								</span>
							</div>
							<span class="help-block" id="error"></span>
						</div>
						<!-- /.col-lg-6 -->

						<div class="row">
							<div class="form-group col-lg-6">
								<div class="input-group">
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-lock"></span>
									</div>
									<input id="password" type="password" name="password"
										class="form-control" placeholder="비밀번호" maxlength="18">
								</div>
								<span class="help-block" id="error"></span>
							</div>
							<div class="form-group col-lg-6">
								<div class="input-group">
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-lock"></span>
									</div>
									<input id="cpassword" name="cpassword" type="password" class="form-control"
										placeholder="비밀번호 확인" maxlength="18">
								</div>
								<span class="help-block" id="error"></span>
							</div>
						</div>
						<div class="custom-control custom-checkbox">
							<input type="checkbox" class="custom-control-input"
								id="defaultUnchecked"> <label
								class="custom-control-label" for="defaultUnchecked"><a
								href="javascript:;">이용 동의</a> 및 <a href="javascript:;">정보 수집</a> 동의</label>
						</div>
						
						<div class="btn-group col-md-6 col-md-offset-3 col-xs-12"
							data-toggle="buttons"style="margin:10px ">
							<label class="btn btn-primary active"> <input
								type="radio" name="options" value="S" id="buyer" autocomplete="off"
								checked> 구매자로 가입
							</label> <label class="btn btn-primary"> <input type="radio"
								name="options" id="seller" value="C" autocomplete="off"> 판매자로 가입
							</label>
						</div>
							<div class="col-md-12 col-xs-12">	
							<p><span style="background-color:#ffacbc;">구매자</span> : 일반 상품을 구매하기 위해 가입하는 고객은 <span style="background-color:#ffacbc;">구매자로 가입</span> 버튼을 눌러주세요! </p>
							<p><span style="background-color:#bbdffd;">판매자</span> : 상품 판매를위해 기업으로 등록을 원하시면 <span style="background-color:#bbdffd;">판매자로 가입</span> 버튼을 눌러주세요! </p>
							</div>
						<div class="form-footer col-md-12 col-xs-12">
							<input class="btn btn-primary btn-lg pull-right disabled" type="submit" id="signUpbtn" value="가입" onclick="return signUpGo()">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>



	
	<script src="resources/bootstrap/js/jquery-3.2.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.js"></script>
	<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
	<script src="resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/custom/addJS/register.js"></script>
	<div class="article">
		<jsp:include page="../footer.jsp"></jsp:include>
	</div>
</body>
</html>
