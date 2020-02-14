<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="resources/custom/addCSS/myroom.css">
<link rel="stylesheet" href="resources/custom/addCSS/footer.css">
<link rel="stylesheet" href="resources/custom/addCSS/star-rating.css">
<link rel="stylesheet" href="resources/custom/addCSS/checkbox.css">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean"
	rel="stylesheet">
<title>나에게 온  주문목록 | Catpple</title>
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
 
}
}

</style>


</head>
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
				<a class="navbar-brand logo" style="margin-top: 0px;padding-top: 0px;" href="home">
					<img src="resources/images/CatppleLogo.png" style="width:140px;">
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
			<div class="collapse navbar-collapse navbar-ex1-collapse" style="max-height:700px;background-color:white;">
				<ul class="nav navbar-nav side-nav" style="height: 90%;">
					<li><h3><a href="#" data-toggle="collapse"
						data-target="#submenu-4"><i class="fa fa-fw fa-star"></i>
							내정보 <i class="fa fa-fw fa-angle-down pull-right"></i></a></h3>
						<ul id="submenu-4" class="collapse">
							<c:if test="${logInUser.mGrade!='S'}">
							<li><a href="mpoint" ><i
									class="fa fa-angle-double-right"></i> 포인트</a></li></c:if>
							<li><a href="mChangef"><i
									class="fa fa-angle-double-right"></i> 내정보변경</a></li>
							<li><a href="mWdrawal"><i
									class="fa fa-angle-double-right"></i> 회원탈퇴</a></li>
						</ul></li>
					<c:if test="${logInUser.mGrade!='S'}">
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
									class="fa fa-angle-double-right"></i> 장바구니<span class="label label-danger">${cartRow}</span></a></li>
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
						</c:if>						
						<c:if test="${logInUser.mGrade!='C'}">
						<li><h3><a href="#" data-toggle="collapse"
						data-target="#submenu-5"><i class="fa fa-fw fa-star"></i>
							판매자 메뉴 <i class="fa fa-fw fa-angle-down pull-right"></i></a></h3>
						<ul id="submenu-5" class="collapse">
							<li><a href="sGForm"><i
									class="fa fa-angle-double-right"></i> 상품등록</a></li>
							<li><a href="sRGoods"><i
									class="fa fa-angle-double-right"></i> 나의 상품</a></li>
							<li><a href="sOList"><i
									class="fa fa-angle-double-right"></i> 주문목록</a></li>
							<li><a href="sOList?dCode=C"><i
									class="fa fa-angle-double-right"></i> 배송완료목록</a></li>
						</ul></li>
					</c:if>
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
						<div class="col-md-12 col-xs-12">
						<div class="col-md-6 col-xs-8">
							<h2 style="color: crimson">받은 주문 목록</h2>  
						</div>
						<div class="col-md-6 col-xs-4 " style="margin-top:17px;"> 
							<button onclick="deliveryButton()"  class="btn btn-danger pull-right" onclick="return confirm('배송하시겠습니까?')">배송하기</button>
						</div>
						</div>
					
						<div class="col-md-10 col-xs-12">
							<form>
							<c:forEach var="list" items="${list}" varStatus="vs">
								<div id="" class="container text-center"
									style="border-top: 2px solid lightgray;padding-top: 10px; padding-bottom: 10px;">
									<div class="col-md-6 col-xs-12"
										style="padding-top: 0px; padding-bottom: 0px; padding-right: 0px; padding-left: 0px;">
										<div class="col-md-6 col-xs-3" style="padding-left: 0px;">
											
											<input name="box2" value="${list.dPk}" type="checkbox" onclick="chBox(this.form,'${list.dState}',${vs.index},${list.oStock},${list.gStock})"> <img class="img"
                                 			   src="resources/sellerInfo/${logInUser.mId}/${list.gName}"/>
											
										
										</div>
										
										<div class="col-md-6 col-xs-9 second-div">
											<h4>${list.gName}</h4>
											
										</div>

									</div>
									<div class="col-md-6 col-xs-12 third-div" style="text-align: left;">
										<div class="col-md-6 col-xs-12">
									  		 주문날짜:${list.oDate}
									   	</div>
									
										<div class="col-md-6 col-xs-12 fourth-div">
		                                	 <span>주문자ID : ${list.member_mId}</span>
		                                </div>
		                                
		                                <div class="col-md-6 col-xs-6">
											<span>단가:${list.gPrice}원</span>
										</div>
		                                
										<div class="col-md-6 col-xs-12" style="padding-right: 10px;">
											<span class="">주문 수량 : ${list.oStock}개 <label style="font-size: x-small;">(재고:${list.gStock}개) </label></span>
										</div>
										<div class="col-md-6 col-xs-12">
											총가격:${list.gPrice*list.oStock}원
										</div>

		                           	      <span>
			                           	      <c:choose> 
			                           	    	  <c:when test="${list.dState=='a' and (list.oStatus=='os3' or list.oStatus=='os4')}">
			                           	    	  <div class="col-md-3 col-xs-6" >
			                           	     		<font style="color:crimson; font-weight: bold; font-size: large;"> 배송준비 중</font>
			                           	     	  </div>
			                           	     	  </c:when>
			                           	     	  
			                           	     	  <c:when test="${list.dState=='b'}">
			                           	     	  <div class="col-md-3 col-xs-6" >
			                           	     		 <font style="color:#FF8C00; font-weight: bold;font-size: large;">배송 중</font>
			                           	     	  </div>
			                           	     	  </c:when>
			                           	     	  
			                           	     	  <c:when test="${list.dState=='d'}">
			                           	     	  <div class="col-md-3 col-xs-6" >
			                           	     	  	<font style="color:#8A0886; font-weight: bold;font-size: large;"> 배송 취소 </font>
			                           	     	  </div>
			                           	     	  </c:when>
			                           	      </c:choose>
		                           	      </span><br>
		                           
		                          	    <c:choose>
		                          	    <c:when test="${list.oStatus=='os1'}">
		                          	    	<div class="col-md-3 col-xs-6">
		                          	    		<font style="font-weight: bold; color:#2E2EFE;">주문취소 완료</font>
		                          	   		</div>
		                          	    </c:when>
		                        
		                          	    <c:when test="${list.oStatus=='os4'}">
		                          	    	<div class="col-md-3 col-xs-6">
		                          	    		<font style="font-weight: bold; color:#FF0000; text-decoration: underline; font-style: italic;">주문취소 요청 중</font>
		                          	   		</div>
		                          	   		<div class="col-md-3 col-xs-6 btn btn-primary" onclick="statusChangeButton(${list.oNum},'${list.oStatus}')">
		                          	   			주문취소 완료
		                          	   		</div>
	                          	   		</c:when>
	                          	   		
										</c:choose>
										
									</div>
								</div>
							</c:forEach>
						</form>
							
						</div>
						<!-- paging -->
						<div class="col-md-10 col-xs-12 text-center">
							<c:choose>
								<c:when test="${currPage>1}">
									<a href="sOList?currPage=1">First</a>&nbsp;
									<a href="sOList?currPage=${currPage-1}">이전</a>&nbsp;&nbsp;
								</c:when>
								<c:otherwise>
									<font color="gray">First&nbsp;이전&nbsp;&nbsp;</font>
								</c:otherwise>
							</c:choose>
							
							<c:forEach  var="i"  begin="${sPage}" end="${ePage}">
								<c:choose>
									<c:when test="${i==currPage}">
										<font size="5" color="Orange">${i}&nbsp;</font>
									</c:when>
									<c:otherwise>
										<a href="sOList?currPage=${i}">${i}&nbsp;</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<c:choose>
								<c:when test="${currPage==totalPageNo}">
									<font color="gray">&nbsp;&nbsp;다음&nbsp;Last</font>
								</c:when>
								<c:otherwise>
									<a href="sOList?currPage=${currPage+1}">&nbsp;다음</a>&nbsp;
									<a href="sOList?currPage=${totalPageNo}">Last</a>&nbsp;
								</c:otherwise>
							</c:choose>
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