<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>상품검색 결과 | The Cat House</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="resources/custom/addCSS/footer.css">
<link rel="stylesheet" href="resources/custom/addCSS/header.css">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">
<style>
.goods-title {
   display: inline-block;
   width: 100%;
   white-space: normal;
   overflow: hidden;
   text-overflow: ellipsis;
   line-height: 1.2;
   height: 3.6em;
   
   display: -webkit-box;
   -webkit-line-clamp: 3;
   -webkit-box-orient: vertical;
   font-weight: bold;
}


.card{

margin:10px 5px; 
padding:10px;
border:5px solid crimson; 
border-radius:10px;

}

@media (max-width:576px){
.card{
   width:100%;

   }
}


.img{
width: 200px ; 
height:200px; 
}

@media(max-width:768px){
.img{
width:100px;
height:100px;

    }

}
</style>
</head>
<body class="font-Jua">
<jsp:include page="../header.jsp"></jsp:include>
	<div class="container" style=" text-align:center;">
	<h2 class="text-left">"오민석"에 대한 검색 결과 입니다.</h2>
      <div class="row">
         <c:forEach begin="1" end="24">
            <div class="col-md-3 col-xs-6">
               <div class="card" >
                  <a href="#"> <img class="img" src="resources/images/item4.jpg"
                     ></a>
                  <div class="goods-title">[쉬바 멜티 증정] 뉴트로 내추럴 초이스 캣 키튼 닭고기와 현미
                     2.27kgdddaaaaaaaaaaaaaaaaaaaaaad</div>
                  <div>
                     <font style="color: crimson; font-weight: bold; font-size: large;">10,000원</font><br>
                     <span>(할인여부등)<br></span> <span
                        style="width: 87.5%; overflow: hidden; color: gold;"><i class="fas fa-star"></i>
                        <i class="glyphicon glyphicon-star"></i>
                        <i class="glyphicon glyphicon-star"></i>
                        <i class="glyphicon glyphicon-star"></i>
                        <i class="glyphicon glyphicon-star"></i>
                        <i class="glyphicon glyphicon-star-empty"></i>
                        </span><br>
                  </div>
               </div>
            </div>
         </c:forEach>
      </div>
      <div align="center" style="margin-top: 3%;">
         <ul class="pagination justify-content-center">
            <li class="page-item"><a class="page-link" href="#">Previous</a></li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">Next</a></li>
         </ul>
      </div>
   </div>
	
<div class="article">
	<jsp:include page="../footer.jsp"></jsp:include>
</div>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
