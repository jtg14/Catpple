<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
<style>

.second-div{
padding-top: 4%;
padding-right: 0px;
}

@media(max-width : 768px){
.second-div{
   margin-top:10px;
}
}
.third-div{

    margin-top:30px;
}
@media(max-width : 768px){
.third-div{
   margin-top:10px;
   margin-bottom:10px;
}
}


@media(max-width : 768px){
.fourth-div{
   margin-top:30px;
}
}

</style>

</head>
<body>

<div class="col-md-10 col-xs-12">
   <h2 style="color:crimson">나의 등록 상품</h2>
      <c:forEach begin="1" end="5">
         <div class="container text-center"
            style="border-top: 2px solid lightgray;padding-top:10px;padding-bottom:10px;">
            <div class="col-md-6 col-xs-12"
               style="padding-top:0px;padding-bottom:0px;padding-right: 0px;padding-left: 0px;">
               <div class="col-md-6 col-xs-3" style="padding-left: 0px;">
                  <img class="img" src="resources/foodImg/mainfood1.jpg"/>
               </div>
               <div class="col-md-6 col-xs-9 second-div">
                  <h4>프로베스트 캣 밸런스 15kg</h4>
                  <label style="font-size: x-small;">재고 있음</label>
               </div>
            </div>
            
            
         <div class="col-md-6 col-xs-12 third-div" >
         <div class="col-md-3 col-xs-3" style="padding-right:0px;">
            <span>10000원</span>
         </div>
         <div class="col-md-9 col-xs-9">
            <span>재고 : 5개</span> 
            <a class="pull-right" href="#">편집하기</a>
         </div>
      
      </div>
         
         
      
         </div>
      </c:forEach>

   </div>
  
</body>
</html>