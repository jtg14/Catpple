<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>myInfoPoint</title>
<style>
.board-content{
	width:40%;
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
	<div class="col-md-10 col-xs-12">
		<div class="col-md-12 col-xs-12">
		<h4>포인트</h4>
		<h5>${logInUser.mName}님의 포인트 : ${logInUser.mPoint}</h5>
			현재 적립예정포인트 <strong style="color: crimson;">100점</strong>
		</div>
				<table class="table">
					<thead>
						<tr>
							<th>날짜</th>
							<th>구분</th>
							<th class="board-content">상세내용</th>
							<th>적립포인트</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach begin="1" end="12">
						<tr style="border-top:0px;">
							<td>2020.01.18</td>
							<td>적립</td>
							<td class="board-content">일반 후기 상품평 등록으로 포인트 적립</td>
							<td>50점</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
	</div>
</body>
</html>