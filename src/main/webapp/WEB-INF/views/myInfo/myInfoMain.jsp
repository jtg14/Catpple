<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>myInfoMain</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container" align="center" style="margin-top: 5%">
		<div class="row">
			<div class="col-3">
				<jsp:include page="myInfoMenuBox.jsp"/>
			</div>
		
			<div class="col-9">
				<c:choose>
					<c:when test="${myInfo!=null}">
						<jsp:include page="${myInfo}.jsp"/>
					</c:when>
					<c:otherwise>
						<jsp:include page="myInfoOrderDelivery.jsp"/>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</body>
</html>