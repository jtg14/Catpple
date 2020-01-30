<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link  rel="stylesheet" href="resources/custom/addCSS/star-rating.css">
<title>myInfoExpectedPoints</title>
<style>
.item-size {
	border: 3px solid lightgray;
	border-radius: 10px;
}
th,td{
text-align:center;
}
@media (min-width: 968px) {
	  tbody{
	  	font-size:18px;
	  }
	}
</style>
</head>
<body>
	<div class="tabs-container-style-1">
		<div class="col-md-12 col-xs-12">
			<ul id="myTab" class="nav nav-tabs" style="font-size: 1.2em;">
				<li class="active"><a href="#home" data-toggle="tab">평가 가능
						상품</a></li>
				<li class=""><a href="#profile" data-toggle="tab">내가 평가한 상품</a></li>
			</ul>
		</div>
		<div id="myTabContent" class="tab-content container">
			<div class="tab-pane fade active in" id="home">
				<div class="col-md-12 col-xs-12">
					<h4>
						적립 예정 포인트<span class="h3" style="color: crimson">900</span>점<br>
						평가 시 결제 가격의<span class="h3" style="color: crimson">5%</span>의 포인트가
						적립 됩니다.
					</h4>
				</div>
				<div class="container">
					<c:forEach begin="1" end="6">
						<div class="col-md-5 col-xs-12 item-size" style="margin: 5px 5px;">
							<table style="width: 100%;">
								<tbody>
									<tr>
										<td><img class="img-responsive"
											src="resources/images/item6.jpg"></td>
										<td>이즈칸 캣 그레인프리 어덜트 6.5kg</td>
										<td><button class="btn btn-warning text-center">평가하기</button></td>
									</tr>
								</tbody>
							</table>
						</div>
					</c:forEach>
				</div>
			</div>
			<!-- end of goodsDetail -->

			<div class="tab-pane fade" id="profile">
			<div class="col-md-12 col-xs-12">
				
					<span class="h3" style="color: crimson">평가해주셔서 감사합니다.</span>
				
			</div>
			<div class="container">
				<c:forEach begin="1" end="6">
					<div class="col-md-5 col-xs-12 item-size" style="margin: 5px 5px;">
						<table style="width: 100%;">
							<tbody>
								<tr>
									<td><img class="img-responsive"
										src="resources/images/item6.jpg"></td>
									<td>
									<p>이즈칸 캣 그레인프리 어덜트 6.5kg</p>
									<p><div class="rating">	
											<i class="glyphicon glyphicon-star"></i> <i
												class="glyphicon glyphicon-star"></i> <i
												class="glyphicon glyphicon-star"></i> <i
												class="glyphicon glyphicon-star"></i> <i
												class="glyphicon glyphicon-star half"></i>
										</div></p>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</c:forEach>
			</div>
			</div>
			<!-- end of change -->
		</div>
	</div>
</body>
</html>