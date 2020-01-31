<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.board-content {
	width: 45%;
	
}

th, td {
	text-align: center;
}

@media ( min-width : 968px) {
	tbody {
		font-size: 18px;
	}
}
</style>
</head>
<body>
	<div class="col-md-10 col-xs-12">
		<div class="col-md-12 col-xs-12">
			<h2>1:1 문의 내역</h2>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th>구분</th>
					<th class="board-content"
						style="padding-right: 0px; padding-left: 0px;">제목</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${list}" varStatus="">
					<tr>
						<td style="padding-left:0px;">[구매관련]</td>
						<td class="board-content"style="padding-right: 0px; padding-left: 0px;text-align: left;"><a href="javascript:;" onclick="BDetail()"><span class="label label-success"
							style="margin-right: 10px;">답변완료</span>${list.bTitle}</a></td>
						<td style="padding-right:0px;">${list.bDate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>