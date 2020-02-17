<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<script>
alert('해당 페이지는 조별 과제 portfolio 를위한 웹 사이트 입니다.');
</script>
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

<c:forEach var="rl" items="${RecomList}">
  <div class="col-xs-12 col-md-3">
    <div class="thumbnail text-center" style="border:1px crimson solid;border-radius:10px;">
      <a href="gDetail?number=${rl.gNum}"><img src="resources/sellerInfo/${rl.member_mId}/${rl.gImg1}" style="width:200px;"></a>
      <div class="caption">
      <div class="col-xs-12 col-md-12" style="min-height:150px;">
        <h3><a href="gDetail?number=${rl.gNum}">${rl.gName}</a></h3>
        </div>
        <div class="rating">
		  <i class="glyphicon glyphicon-star"></i>
		  <i class="glyphicon glyphicon-star"></i>
		  <i class="glyphicon glyphicon-star"></i>
		  <i class="glyphicon glyphicon-star"></i>
		  <i class="glyphicon glyphicon-star half"></i>
		</div>
        <p style="color:cimson;font-size:1.5em;"><fmt:formatNumber value="${rl.gPrice}" pattern="#,###" />원</p>
      </div>
    </div>
  </div>
  </c:forEach>
  <div class="col-md-12 col-xs-12"><h2>새로 들어온 상품</h2></div>
  
<c:forEach var="gl" items="${goodsHomeList}">
  <div class="col-xs-12 col-md-3">
    <div class="thumbnail text-center" style="border:1px crimson solid;border-radius:10px;">
      <a href="gDetail?number=${gl.gNum}"><img src="resources/sellerInfo/${gl.member_mId}/${gl.gImg1}" style="width:200px;"></a>
      <div class="caption">
      <div class="col-xs-12 col-md-12 " style="min-height:150px;">
        <h3><a href="gDetail?number=${gl.gNum}">${gl.gName}</a></h3>
       </div>
        <div class="rating">
		  <i class="glyphicon glyphicon-star"></i>
		  <i class="glyphicon glyphicon-star"></i>
		  <i class="glyphicon glyphicon-star"></i>
		  <i class="glyphicon glyphicon-star"></i>
		  <i class="glyphicon glyphicon-star half"></i>
		</div>
        <p style="color:cimson;font-size:1.5em;"><fmt:formatNumber value="${gl.gPrice}" pattern="#,###" />원</p>
      </div>
    </div>
  </div>
  </c:forEach>
    
</div>
  <div class="col-md-12 col-xs-12">
<img src="resources/images/catanddog.png" style="width:100%;hight:100%;">
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