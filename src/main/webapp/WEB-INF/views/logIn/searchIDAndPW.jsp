<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 / 비밀번호 찾기 |Catpple</title>	
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="resources/custom/addCSS/footer.css">
<link rel="stylesheet" href="resources/custom/addCSS/goodsInfo.css">
<link rel="stylesheet" href="resources/custom/addCSS/header.css">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
   <div class="container">
      <div class="container col-md-offset-4 col-md-4 col-xs-12"
         style="border: 5px solid crimson; border-radius: 10px; padding: 20px;">
         <div class="col-md-12 col-xs-12 text-center">
            <h3 style="margin-top: 5px;">아이디 찾기</h3>

            <form action="#" method="post">
               <div class="col-md-12 col-xs-12 text-center">
                  <input class="form-control input-sm" type="text" placeholder="아이디">
                  <input class="form-control input-sm" type="text"
                     placeholder="전화번호" style="margin-top: 5px;">
               </div>
               <div class="col-md-12 col-xs-12 text-center"
                  style="margin-top: 10px;">
                  <button class="btn btn-success btn-block" id="idfindbtn"
                     style="padding-left: 0px; padding-right: 0px;">아이디
                     찾기</button>
               </div>
            </form>
         </div>

         <div class="col-md-12 col-xs-12 text-center">
            <h3>비밀번호 찾기</h3>

            <form action="#" method="post">
               <div class="col-md-12 col-xs-12 text-center">
                  <input id="mid" class="form-control input-sm" type="text"
                     placeholder="아이디"> <input id="mphone"
                     class="form-control input-sm" type="text" placeholder="전화번호"
                     style="margin-top: 5px;"> <input id="mname"
                     class="form-control input-sm" type="text" placeholder="이름"
                     style="margin-top: 5px;">
               </div>
               <div class="col-md-12 col-xs-12 text-center"
                  style="margin-top: 10px;">
                  <button class="btn btn-success btn-block" id="idfindbtn"
                     style="padding-left: 0px; padding-right: 0px;" onclick="find()">비밀번호
                     찾기</button>
               </div>
            </form>
         </div>
      </div>
   </div>

      <!-- resultArea에 들어갈 코드 -->
    
  
<div class="article">
	<jsp:include page="../footer.jsp"></jsp:include>
</div>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.js"></script>
<script
	src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<script src="resources/bootstrap/js/bootstrap.min.js"></script>
<script src="resources/register.js"></script>
<script src="resources/custom/addJS/minifunction.js"></script>
</body>
</html>