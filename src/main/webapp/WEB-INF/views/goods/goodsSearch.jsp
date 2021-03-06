<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false"%>
<html>
<head>
<title>상품검색 결과 | Catpple</title>
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
      <div class="row">
      <c:if test="${searchResult ne null}">
		<h2 class="text-left">"${searchWord}"에 대한 검색 결과가 총 ${fn:length(searchResult)}건 검색 되었습니다.</h2>
         <c:forEach var="list" items="${searchResult}">
            <div class="col-md-3 col-xs-6">
               <div class="card" >
                  <a href="gDetail?number=${list.gNum}"> <img class="img" src="resources/sellerInfo/${list.member_mId}/${list.gImg1}"></a>
                 <div class="goods-title"><a href="gDetail?number=${list.gNum}"> ${list.gName}</a></div>
                  <div>
                     <font style="color: crimson; font-weight: bold; font-size: large;">${list.gPrice}원</font><br>
                      <span
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
         </c:if>
         <c:if test="${searchResult eq null}">
         		<h2>"${searchWord}"에 대한 검색 결과가 없습니다.</h2>
         </c:if>
      </div>
   </div>
	
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="resources/bootstrap/js/bootstrap.min.js"></script>

<div class="article">
	<jsp:include page="../footer.jsp"></jsp:include>
</div>
</body>
</html>
