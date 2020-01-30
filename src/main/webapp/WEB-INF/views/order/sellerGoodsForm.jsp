<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<style>
input[type=number]::-webkit-inner-spin-button, 
input[type=number]::-webkit-outer-spin-button { 
  -webkit-appearance: none; 
  margin: 0; 
}	
</style>
<body>

   <div class="col-md-8 col-md-offset-1 col-xs-12" style="border:5px solid crimson;border-radius:10px;">
         <h2 style="margin-top: 5%;text-align:center">상품 등록</h2>
         <form action="goodsInsert" method="post" enctype="multipart/form-data">
            <div style="margin: 10px 30px;">
               <!-- Row1 아이디/이름-->
               <div class="row">
                  <h3>판매자 정보</h3>
                  <!-- Grid column -->
                  <div class="col-md-3 col-xs-6">
                     <!-- Material input -->
                     <div class="form-group">
                        <label for="memberID">ID</label> <input type="text"
                           class="form-control" id="memberID" placeholder="ID"
                           name="mId" value="${logInUser.mId}" readonly="readonly">
                     </div>
                  </div>
                  <!-- Grid column  -->

                  <!-- Grid column -->
                  <div class="col-md-3 col-xs-6">
                     <!-- Material input -->
                     <div class=" form-group">
                        <label for="memberName">회사명</label> <input type="text"
                           class="form-control" id="memberName" placeholder="이름"
                           name="mName" value="${logInUser.mName}" readonly="readonly">
                     </div>
                  </div>
                  <!-- Grid column -->
               </div>
               <hr>
               <!-- /row1  -->



               <!-- row2 상품번호/카테고리 코드 -->
               <div class="row">
                  <div style="width: 100%;">
                     <h3>상품 정보</h3>
                  </div>
                  <!-- Grid column -->
                  <div class="col-md-2 col-xs-12">
                     <!-- Material input -->
                     <div class=" form-group">
                        <label for="goodsCategory">상품 카테고리</label>
                        <select class="form-control" id="goodsCategory" name="gcategory">
                           <option value="사료">사료</option>
                           <option value="캔/간식">캔/간식</option>
                           <option value="장난감">장난감</option>
                           <option value="화장실/매트">화장실/매트</option>
                        </select>
                     </div>
                  </div>
                  <!-- Grid column -->
               </div>
               <!-- /row2  -->


               <!-- row3 상품이름 -->
               <div class="row">
                  <!-- Grid column -->
                  <div class="col-md-4 col-xs-12">
                     <!-- Material input -->
                     <div class="form-group">
                        <label for="goodsName">상품 이름</label> <input type="text"
                           class="form-control" id="goodsName" name="gname" placeholder="상품이름">

                     </div>
                  </div>
                  <!-- Grid column -->
               </div>
               <!-- /row3 -->


               <!-- row4 상품가격/상품수량/등록날짜 -->
               <div class="row">
                  <!-- Grid column -->
                  <div class="col-md-2 col-xs-6">
                     <label for="goodsPrice">상품 가격</label>
                     <!-- Material input -->
                     <div class="form-group ">
                        <div class="input-group">
                           <input type="number" class="form-control" id="gprice" name="gPrice"
                              placeholder="0"> <span class="input-group-addon">원</span>
                        </div>
                     </div>
                  </div>
                  <!-- Grid column -->
                  <div class="col-md-2 col-xs-6">
                     <label for="goodsAmount">상품 수량</label>
                     <!-- Material input -->
                     <div class="form-group">
                        <div class="input-group">
                           <input type="number" class="form-control" id="goodsAmount"
                              name="gstock" placeholder="0"> <span class="input-group-addon">개</span>
                        </div>
                     </div>
                  </div>
               </div>
               <!-- /row4 -->

               <!-- row5 상품 정보 -->
               <div class="row">
                  <div class="col-md-12">
                     <label for="goodsInfo">상품 정보</label>
                     <div class="form-group">
                        <textarea rows="5" cols="50" class="form-control" id="goodsInfo"
                         name="ginfo"  placeholder="상품 내용을 입력하세요."></textarea>
                     </div>
                  </div>
               </div>
               <!-- /row5 -->

               <!-- row6 상품 이미지 -->
               <div class="row">
                  <div class="col-md-12">
                     <label for="goodsInfo">상품 이미지1</label>
                     <div class="form-group">
                        <input class="form-control" type="file" id="uploadfilef"
                           name="gimgf1">
                     </div>
                  </div>

                  <div class="col-md-12">
                     <label for="goodsInfo">상품 이미지2</label>
                     <div class="form-group">
                        <input class="form-control" type="file" id="uploadfilef"
                           name="gimgf2">
                     </div>
                  </div>
               </div>
               <!-- /row6 -->

               <button type="submit" class="btn btn-primary btn-md">상품 등록</button>
            </div>
         </form>

   </div>

</body>
</html>