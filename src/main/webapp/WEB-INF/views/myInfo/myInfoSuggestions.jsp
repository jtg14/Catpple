<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
			<h2>건의사항</h2>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th>작성자</th>
					<th class="board-content"
						style="padding-right: 0px; padding-left: 0px;">[추천수]제목</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach begin="1" end="12">
					<tr>
						<td style="padding-left:0px;">전태구</td>
						<td class="board-content"style="padding-right: 0px; padding-left: 0px;text-align:left;">[96]사이트 디자인 개선안.</td>
						<td style="padding-right:0px;">2020-01-26</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>