<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
<style>
@media (max-width : 768px) {
     .first-div{
         border-top: 1px solid lightgray;
      }
   }
.second-div{
padding-top: 4%;
padding-right: 0px;
}

@media(max-width : 758px){
.second-div{
   margin-top:20px;
}
}
.third-div{
    margin-top:30px;
}
@media(max-width : 758px){
.third-div{
   margin-top:0px;
}
}


@media(max-width : 758px){
.fourth-div{
   margin-top:30px;
}
}

</style>

</head>
<body>

<div class="col-md-10 col-xs-12">
   <h2 style="color:crimson">받은 주문 목록</h2>
      <c:forEach begin="1" end="5">
         <div class="container text-center"
            style="border-top: 2px solid lightgray;padding-top:10px;padding-bottom:10px;">
            <div class="col-md-6 col-xs-12"
               style="padding-top:0px;padding-bottom:0px;padding-right: 0px;padding-left: 0px;">
               <div class="col-md-6 col-xs-3" style="padding-left: 0px;">
                  <input type="checkbox">
                  <img class="img" src="resources/foodImg/mainfood1.jpg"/>
               </div>
               <div class="col-md-6 col-xs-9 second-div">
                  <h4>프로베스트 캣 밸런스 15kg</h4>
                  <label style="font-size: x-small;">재고 있음</label>
               </div>


            </div>
            <div class="col-md-6 col-xs-12 third-div">
         <div class="col-md-6 col-xs-6">
            <span>10000원</span>
         </div>
         <div class="col-md-3 col-xs-4" style="padding-right:10px;">
            <span class="pull-right">주문 수량 : </span>
         </div>
         <div class="col-md-3 col-xs-2">
            <span class="pull-left">5</span> 
         </div>
         
         <div class="col-md-6 col-xs-12 fourth-div" style="margin-top:10px;">
            <span>주문자ID : prokofiev</span>
         </div>
         
         
         
      </div>
         </div>
      </c:forEach>

   </div>
  
</body>
</html>