<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myInfoChange</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
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
}
</style>
<script type="text/javascript">
function emailChangeBtn(){
	$('#mEmail').removeClass('readonly');
};
</script>
</head>
<body>
	<h1>내 정보 수정</h1>
	<div class="col-md-12 col-xs-12">
		<div class="col-md-6 col-xs-12 text-center">
			<div class="container"
				style="border: 5px solid crimson; border-radius: 10px; padding: 20px;">
				
				<form action="myInfoChange" method="post">
					<table class="table text-center">
						<tr>
							<td class="table-head"
								style="padding-left: 0px; padding-right: 0px;">아이디</td>
							<td style="text-align: left;">
								<div class="col-md-6 col-xs-12">
								<input class="form-control input-sm" type="text" readonly="readonly"
										name="mId" value="${logInUser.mId}">
								</div>
							</td>
						</tr>
						<tr>
							<td class="table-head"
								style="padding-left: 0px; padding-right: 0px;">비밀번호</td>
							<td style="text-align: left;"><div
									class="col-md-6 col-xs-12" style="padding-left: 0px;">
									<input class="form-control input-sm" type="password"
									 name="mPw"	placeholder="비밀번호">
									<input
										class="form-control input-sm" type="password"
										placeholder="비밀번호 확인" style="margin-top: 5px;">
								</div></td>
						</tr>
						<tr>
							<td class="table-head"
								style="padding-left: 0px; padding-right: 0px;">이메일</td>
							<td style="text-align: left;">
								<div class="col-md-6 col-xs-12" style="padding-left: 0px;">
									<input class="form-control input-sm" type="text" readonly="readonly"
									 id="mEmail" name="mEmail" value="${logInUser.mEmail}" placeholder="이메일">
								</div>
								<div class="col-md-6 col-xs-6" style="margin-bottom: 8px;">
									<button id="emailChangeBtn" onclick="return emailChangeBtn()" class="btn btn-sm">이메일변경</button>
								</div>
							</td>
						</tr>
						<tr>
							<td class="table-head"
								style="padding-left: 0px; padding-right: 0px;">휴대폰</td>
							<td style="text-align: left;">
								<div class="col-md-6 col-xs-12" style="padding-left: 0px;">
									<input class="form-control input-sm" type="text" readonly="readonly"
										name="mPhone" value="${logInUser.mPhone}" placeholder="휴대폰번호">
								</div>
								<div class="col-md-6 col-xs-6" style="margin-bottom: 8px;">
									<button class="btn btn-sm">휴대폰변경</button>
								</div>
							</td>
						</tr>
						<tr>
							<td class="table-head"
								style="padding-left: 0px; padding-right: 0px;">이름</td>
							<td style="text-align: left;">
								<div class="col-md-6 col-xs-12">${logInUser.mName}</div>
							</td>
						</tr>
						<c:choose>
							<c:when test="${logInUser.mAddr1!=0}">
								<tr>
									<td class="table-head"
										style="padding-left: 0px; padding-right: 0px;">주소</td>
									<td style="text-align: left;">
										<div class="col-md-2 col-xs-6" style="padding-left: 0px;">
										<input type="text" class="form-control input-sm" readonly="readonly"
										 name="mAddr1" value="${logInUser.mAddr1}"	style="margin-bottom: 8px;">
										</div>
										<div class="col-md-10 col-xs-6" style="margin-bottom: 8px;">
											<button class="btn btn-sm">주소 변경</button>
										</div>
										<div class="col-md-12 col-xs-12" style="padding-left: 0px;">
											<input type="text" class="form-control input-sm" readonly="readonly"
												name="mAddr2" value="${logInUser.mAddr2}"	style="margin-bottom: 8px;">
											<input type="text" readonly="readonly"
												name="mAddr3" value="${logInUser.mAddr3}"	class="form-control input-sm">
										</div>
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr>
									<td class="table-head"
										style="padding-left: 0px; padding-right: 0px;">주소</td>
									<td style="text-align: left;">
									<div class="col-md-2 col-xs-6" style="padding-left: 0px;">
										<input type="text" class="form-control input-sm"
										 name="mAddr1" value="0" style="margin-bottom: 8px;">
									</div>
									<div class="col-md-10 col-xs-6" style="margin-bottom: 8px;">
										<button class="btn btn-sm">주소 찾기</button>
									</div>
									<div class="col-md-12 col-xs-12" style="padding-left: 0px;">
										<input type="text" class="form-control input-sm"
											name="mAddr2" style="margin-bottom: 8px;"> 
										<input type="text"
											name="mAddr3" class="form-control input-sm">
								</div>
									</td>
								</tr>
							</c:otherwise>
						</c:choose>
						
						<tr>
							<td class="table-head"
								style="padding-left: 0px; padding-right: 0px;">포인트</td>
							<td style="text-align: left;"><div
									class="col-md-6 col-xs-12">0</div></td>
						</tr>
					</table>
					<div class="col-md-12 col-xs-12">
						<button type="submit" class="btn">수정</button>
					</div>
				</form>
				
			</div>
		</div>
	</div>
</body>
</html>