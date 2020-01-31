<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/custom/addCSS/star-rating.css">
<script src="resources/custom/addJS/myroom.js"></script>
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
@media(max-width: 968px){
	#sel{
		font-size:1em;	
	}
}
</style>

</head>
<body>
	<div class="tabs-container-style-1">
		<div class="col-md-12 col-xs-12">
			<ul id="myTab" class="nav nav-tabs" style="font-size: 1.5em;">
				<li class="active"><a href="#home" data-toggle="tab">1:1 문의</a></li>
				<li class=""><a href="#profile" data-toggle="tab">건의사항</a></li>
			</ul>
		</div>
		<div id="myTabContent" class="tab-content container">
			<div class="tab-pane fade active in" id="home">
				<div class="col-md-12 col-xs-12">
					<h2>1:1 문의</h2>
				</div>
				<div class="col-md-12 col-xs-12">
					<h4 style="color: darkgray;">문의 해주시면 친절히 답변해 드리 겠습니다.</h4>
				</div>
				<div class="container">
					<form  action="#" method="post">
						<div class="col-md-12 col-xs-12">
							<h3>작성자<span>${logInUser.mName}</span></h3>
						</div>
						<div class="col-md-1 col-xs-4">
						<h3>분류</h3>
						</div>
						<div class="col-md-2 col-xs-6">
						<div class="form-group"style="margin-top:15px;">
						  <select class="form-control" id="sel1">
						    <option>[구매 관련]</option>
						    <option>[배송 관련]</option>
						    <option>[결제 문의]</option>
						    <option>[기타]</option>
						  </select>
						</div>
						</div>
						<div class="col-md-12 col-xs-12">
							<h3>제목</h3>
						</div>
						<div class="col-md-12 col-xs-12">
							<input class="form-control input-sm" name="bTitle" id="bTitle">
						</div>
						<div class="col-md-12 col-xs-12">
							<h3>내용</h3>
						</div>
						<div class="col-md-12 col-xs-12">
							<textarea class="form-control noresize" name="bContent"
								id="bContent" style="height: 140px;"></textarea>
						</div>
						<div class="col-md-12 col-xs-12" style="margin-top: 20px;">
							<input id="binsert" class="btn btn-primary btn-lg pull-right" type="submit" value="문의하기">
						</div>
						
					</form>
				</div>
			</div>
			<!-- end of goodsDetail -->

			<div class="tab-pane fade" id="profile">
				<div class="col-md-12 col-xs-12">
					<h2>건의사항</h2>
				</div>
				<div class="col-md-12 col-xs-12">
					<h4 style="color: darkgray;">고객님의 의견을 적극 반영 하겠습니다!</h4>
				</div>
				<div class="container">
					<form id="form-customerSuggestion" action="" method="post">
						<div class="col-md-12 col-xs-12">
							<h3>제목</h3>
						</div>
						<div class="col-md-12 col-xs-12">
							<input class="form-control input-sm" name="bTitle" id="bTitle">
						</div>
						<div class="col-md-12 col-xs-12">
							<h3>내용</h3>
						</div>
						<div class="col-md-12 col-xs-12">
							<textarea class="form-control noresize" name="bContent"
								id="bContent" style="height: 140px;"></textarea>
						</div>
						<div class="col-md-12 col-xs-12" style="margin-top: 20px;">
							<button class="btn btn-primary btn-lg pull-right">문의하기</button>
						</div>
					</form>
				</div>
			</div>
			<!-- end of change -->
		</div>
	</div>
	
	
	
</body>
</html>