<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록/캣플</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="resources/custom/addCSS/myroom.css">
<link rel="stylesheet" href="resources/custom/addCSS/footer.css">
<link rel="stylesheet" href="resources/custom/addCSS/star-rating.css">
<link rel="stylesheet" href="resources/custom/addCSS/checkbox.css">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean"
	rel="stylesheet">
</head>
<style>
input[type=number]::-webkit-inner-spin-button, 
input[type=number]::-webkit-outer-spin-button { 
  -webkit-appearance: none; 
  margin: 0; 
}	
</style>
<script type="text/javascript">
// 대분류
var firstList = new Array("사료","캔/간식","장난감","화장실/매트");

// 소분류

var secondList1 = new Array("고양이처방식","노묘용","성묘용","자묘용","전연령용");
var secondList2 = new Array("간식캔","주식캔","스낵","건조간식","통살");
var secondList3 = new Array("낚싯대", "막대", "인형/쿠션", "공", "박스/하우스");
var secondList4 = new Array("하우스화장실", "평판화장실", "화장실매트","거름망","배변패드");
// 페이지 로딩시 자동 실행  
window.onload = function(){
    var v_firstSelect = document.getElementById("firstSelect"); // SELECT TAG
      
    for (i =0 ; i<firstList.length; i++){
        // 새로운 <option value=''>값</option> 태그 생성
        var optionEl = document.createElement("option");
  
        // option태그에 value 속성 값으로 저장
        optionEl.value = firstList[i];
      
        // text 문자열을 새로 생성한 <option> 태그의 값으로 추가
        optionEl.appendChild (document.createTextNode(firstList[i]));
      
        // 만들어진 option 태그를 <select>태그에 추가
        v_firstSelect.appendChild(optionEl);
    }
  
    var v_secondSelect = document.getElementById("secondSelect"); // SELECT TAG
    v_secondSelect.style.display = "none";  // 태그 감추기
  
}

// 대분류 선택시
function changeFirstSelect(){
    var v_firstSelect = document.getElementById("firstSelect"); // SELECT TAG
    var idx = v_firstSelect.options.selectedIndex;     // 선택값 0 ~ 4
     

    if (idx < 1 && idx > 4){
        return;
    }
 
    secondSelectFill(idx);   // 중분류 생성
}


function secondSelectFill(idx){
    var v_secondSelect = document.getElementById("secondSelect"); // SELECT TAG
 
    var data = null;
  
    if (idx == 0) {
        v_secondSelect.style.display = "none";  // 중분류 태그 감추기
        return;
    }
  
    if (idx == 1){
     data = secondList1
   
     }
    if (idx == 2){
     data = secondList2
     
     }
    if (idx == 3){
    	data = secondList3
    }
    if (idx == 4 ){
    	data = secondList4
    }

    v_secondSelect.innerHTML = "";  // 태그 출력
      
    for (i =0 ; i<data.length; i++){ 
        // 새로운 <option value=''>값</option> 태그 생성
        var optionEl = document.createElement("option");
  
        // value 속성 태그에 저장
        optionEl.value = data[i];
      
        // text 문자열을 새로 생성한 <option> 태그에 추가
        optionEl.appendChild (document.createTextNode(data[i]));
      
        // 만들어진 option 태그를 <select>태그에 추가
        v_secondSelect.appendChild(optionEl);
    }
  
v_secondSelect.style.display = ""; // 중분류 태그 출력
  

}
</script>
<body class="font-Jua">

	<div id="throbber" style="display: none; min-height: 120px;"></div>
	<div id="noty-holder"></div>
	<div id="wrapper">
		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-ex1-collapse" >
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand logo" style="margin-top: 5px;" href="home">
					<img alt="로고자리" src="...">
				</a>
			</div>
			<!-- Top Menu Items -->
			<ul class="nav navbar-right top-nav">
				<li><a href="#" data-placement="bottom" data-toggle="tooltip"
					href="#" data-original-title="Good"><i
						class="fa fa-bar-chart-o"></i> </a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">나의메뉴 <b class="fa fa-angle-down"></b></a>
					<ul class="dropdown-menu">
						<li><a href="mroom"><i class="fa fa-fw fa-user"></i>${logInUser.mName}
								님(마이룸)</a></li>
						<li class="divider"></li>
						<li><a href="logOut"><i class="fa fa-fw fa-power-off"></i>
								로그아웃</a></li>
					</ul></li>
			</ul>
			<!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
			<div class="collapse navbar-collapse navbar-ex1-collapse" style="max-height:700px;">
				<ul class="nav navbar-nav side-nav" style="height: 90%;">
					<li><h3>
							<a href="#" data-toggle="collapse" data-target="#submenu-1"
								aria-expended="true"><i class="fa fa-fw fa-search"></i>내지갑 <i
								class="fa fa-fw fa-angle-down pull-right"></i></a>
						</h3>
						<ul id="submenu-1" class="collapse">
							<li><a href="mpoint" ><i
									class="fa fa-angle-double-right"></i> 포인트</a></li>
							<li><a href="mEPoint" ><i
									class="fa fa-angle-double-right"></i> 적립 예정 포인트</a></li>
						</ul></li>
					<li><h3><a href="#" data-toggle="collapse"
						data-target="#submenu-2"><i class="fa fa-fw fa-star"></i>
							주문배송 <i class="fa fa-fw fa-angle-down pull-right"></i></a></h3>
						<ul id="submenu-2" class="collapse">
							<li><a href="mODelivery"><i
									class="fa fa-angle-double-right"></i> 주문/배송조회</a></li>
							<li><a href="mOCancel"><i
									class="fa fa-angle-double-right"></i> 주문취소</a></li>
							<li><a href="mRExchange"><i
									class="fa fa-angle-double-right"></i> 반품/교환</a></li>
							<li><a href="mCart"><i
									class="fa fa-angle-double-right"></i> 장바구니</a></li>
						</ul></li>
					<li><h3><a href="#" data-toggle="collapse"
						data-target="#submenu-3"><i class="fa fa-fw fa-star"></i>
							고객센터 <i class="fa fa-fw fa-angle-down pull-right"></i></a></h3>
						<ul id="submenu-3" class="collapse">
							<li><a href="mCustomerInquiry"><i
									class="fa fa-angle-double-right"></i> 1:1문의</a></li>
							<li><a href="mFAQ"><i
									class="fa fa-angle-double-right"></i> FAQ</a></li>
							<li><a href="mSuggestions"><i
									class="fa fa-angle-double-right"></i> 건의사항</a></li>
							<li><a href="mWriting"><i
									class="fa fa-angle-double-right"></i> 글쓰기 (모든글)</a></li>
						</ul></li>
					<li><h3><a href="#" data-toggle="collapse"
						data-target="#submenu-4"><i class="fa fa-fw fa-star"></i>
							내정보 <i class="fa fa-fw fa-angle-down pull-right"></i></a></h3>
						<ul id="submenu-4" class="collapse">
							<li><a href="mChangef"><i
									class="fa fa-angle-double-right"></i> 내정보변경</a></li>
							<li><a href="mWdrawal"><i
									class="fa fa-angle-double-right"></i> 회원탈퇴</a></li>
						</ul></li>
					<li><h3><a href="#" data-toggle="collapse"
						data-target="#submenu-5"><i class="fa fa-fw fa-star"></i>
							판매자 메뉴 <i class="fa fa-fw fa-angle-down pull-right"></i></a></h3>
						<ul id="submenu-5" class="collapse">
							<li><a href="sGForm"><i
									class="fa fa-angle-double-right"></i> 상품등록</a></li>
							<li><a href="sGUForm"><i
									class="fa fa-angle-double-right"></i> 등록상품 수정</a></li>
							<li><a href="sRGoods"><i
									class="fa fa-angle-double-right"></i> 나의 상품</a></li>
							<li><a href="sOList"><i
									class="fa fa-angle-double-right"></i> 주문목록</a></li>
						</ul></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</nav>

		<div id="page-wrapper">
			<div class="container-fluid">
				<!-- Page Heading -->
				<div class="row" id="main"
					style="min-height: 1000px; margin-top: 120px;">
					<div class="col-sm-12 col-md-12" id="content">
						<!-- 메인 공간 -->


						<div class="col-md-8 col-md-offset-1 col-xs-12"
							style="border: 5px solid crimson; border-radius: 10px;">
							<h2 style="margin-top: 5%; text-align: center">상품 등록</h2>
							<form action="goodsInsert" method="post"
								enctype="multipart/form-data">
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
										<div class="col-md-3 col-xs-12">
											<select class="form-control" id="firstSelect" name="gcategory" onChange="changeFirstSelect();">
        										<option value="">대분류</option>
    										</select>
  										</div>
  										<div class="col-md-3 col-xs-12">
    										<select class="form-control" name="gcategory2" id="secondSelect">
        										<option value="">소분류</option>
    										</select>
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
													class="form-control" id="goodsName" name="gname"
													placeholder="상품이름">

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
													<input type="number" class="form-control" id="gprice"
														name="gPrice" placeholder="0"> <span
														class="input-group-addon">원</span>
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
														name="gstock" placeholder="0"> <span
														class="input-group-addon">개</span>
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
												<textarea rows="5" cols="50" class="form-control"
													id="goodsInfo" name="ginfo" placeholder="상품 내용을 입력하세요."></textarea>
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

									<button type="submit" class="btn btn-primary btn-md">상품
										등록</button>
								</div>
							</form>

						</div>


					</div>
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->


	<script src="resources/bootstrap/js/jquery-3.2.1.min.js"></script>
	<script src="resources/bootstrap/js/bootstrap.js"></script>
	<script src="resources/custom/addJS/myroom.js"></script>
</body>
<footer>
	<div class="article">
		<jsp:include page="../footer.jsp" />
	</div>
</footer>
</html>