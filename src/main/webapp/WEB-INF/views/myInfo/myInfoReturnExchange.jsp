<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Latest compiled and minified CSS -->
<style>

.first-div{
margin-top: 30px;
}

@media(max-width : 758px){
.first-div{
   margin-top:20px;
}
}
.second-div{
    margin-top:30px;
    text-align:left;
}
@media(max-width : 758px){
.second-div{
   margin-top:10px;
}
}


@media(max-width : 758px){
.thirds-div{
   margin-top:10px;
   margin-bottom:10px;
}
}

img{
 width:100px;
 height:100px;
}

</style>

</head>
<body>

<div class="col-md-10 col-xs-12">
   <h2 style="color:crimson">반품/교환 목록</h2>
   
   
      <c:forEach begin="1" end="5">
         <div class="container text-center"
            style="border-top: 2px solid lightgray;padding-top:10px;padding-bottom:10px;">
            <div class="col-md-6 col-xs-12"
               style="padding-top:0px;padding-bottom:0px;padding-right: 0px;padding-left: 0px;">
               <div class="col-md-6 col-xs-3" style="padding-left: 0px;">
              <img class="img" src="resources/img/feed1.jpg"/ >
               </div>
               <div class="col-md-6 col-xs-9 first-div">
                  <h4>프로베스트 캣 밸런스 15kg</h4>
               </div>
            </div>
            
            <div class="col-md-6 col-xs-12 second-div">
         <div class="col-md-3 col-xs-6">
            <span>10000원</span>
         </div>
         <div class="col-md-3 col-xs-6" style="padding-right:10px;">
            <span >수량 :  5 </span>
         </div>
         
         
         <div class="col-md-5 col-xs-6 thirds-div">
            <span>반품 날짜: xxxx/xx/xx</span>
         </div>
         
         <div class="col-md-offset-6
          col-md-3 col-xs-6" style="margin-top:10px; margin-bottom:10px; ">
            <span style="font-weight:bold; color:crimson;">반품완료</span>
         </div>
         
         </div>
         </div>
      </c:forEach>

   </div>
  
</body>