<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Catpple</title>
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="resources/custom/addCSS/star-rating.css">
<link rel="stylesheet" href="resources/custom/addCSS/header.css">
<link rel="stylesheet" href="resources/custom/addCSS/footer.css">

<link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">
<style>
.carousel-image{
	width:100%;
	height:500;	
}
.carousel-subtitle{
	color:lightgray;
}
</style>
</head>
<body>
<jsp:include page="header.jsp"/>
<!-- header Navbar -->
<div class="col-md-12 col-xs-12" style="margin-bottom:50px;">
	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
    <li data-target="#carousel-example-generic" data-slide-to="3"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img class="carousel-image" src="resources/images/carousel1.jpg">
      <div class="carousel-caption">
      </div>
    </div>
    <div class="item">
      <img class="carousel-image" src="resources/images/carousel2.jpg">
      <div class="carousel-caption">
      </div>
    </div>
    <div class="item">
      <img class="carousel-image" src="resources/images/carousel3.jpg">
      <div class="carousel-caption">
      </div>
     </div>
    <div class="item">
      <img class="carousel-image" src="resources/images/carousel4.jpg">
      <div class="carousel-caption">
      </div>
     </div>
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
</div>
<div class="col-md-10 col-md-offset-1 col-xs-12">
<div class="row">
<div class="col-md-12 col-xs-12"><h2>추천상품</h2></div>
<c:forEach begin="1" end="12" varStatus="vs">
  <div class="col-xs-6 col-md-3">
    <div class="thumbnail text-center">
      <img src="resources/images/item${vs.index}.jpg">
      <div class="caption">
        <h3><a href="#">에코 필라인 퓨어 9.08kg</a></h3>
        <div class="rating">
		  <i class="glyphicon glyphicon-star"></i>
		  <i class="glyphicon glyphicon-star"></i>
		  <i class="glyphicon glyphicon-star"></i>
		  <i class="glyphicon glyphicon-star"></i>
		  <i class="glyphicon glyphicon-star half"></i>
		</div>
        <p style="color:cimson;">20,000원</p>
      </div>
    </div>
  </div>
  </c:forEach>
  <div class="col-md-12 col-xs-12"><h2>새로 들어온 상품</h2></div>
<c:forEach begin="1" end="12" varStatus="vs">
  <div class="col-xs-6 col-md-3">
    <div class="thumbnail text-center">
      <img src="resources/images/item${vs.index}.jpg">
      <div class="caption">
        <h3><a href="#">에코 필라인 퓨어 9.08kg</a></h3>
        <div class="rating">
		  <i class="glyphicon glyphicon-star"></i>
		  <i class="glyphicon glyphicon-star"></i>
		  <i class="glyphicon glyphicon-star"></i>
		  <i class="glyphicon glyphicon-star"></i>
		  <i class="glyphicon glyphicon-star half"></i>
		</div>
        <p style="color:cimson;">12,000원</p>
      </div>
    </div>
  </div>
  </c:forEach>
  <div class="col-md-12 col-xs-12">
  <img src="resources/images/catanddog.png">
  </div>
</div>
</div>

	<script src="resources/bootstrap/js/jquery-3.2.1.min.js"></script>
	<script src="resources/bootstrap/js/bootstrap.js"></script>
	<script src="resources/custom/addJS/header.js"></script>
</body>
<footer>
<div class="article">
	<jsp:include page="footer.jsp"/>
</div>
</footer>
</html>