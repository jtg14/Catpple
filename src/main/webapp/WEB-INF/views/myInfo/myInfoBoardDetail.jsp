<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="resources/custom/addCSS/myroom.css">
<link rel="stylesheet" href="resources/custom/addCSS/footer.css">
<link rel="stylesheet" href="resources/custom/addCSS/star-rating.css">
<link rel="stylesheet" href="resources/custom/addCSS/checkbox.css">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean"
	rel="stylesheet">
<title>글 상세 | Catpple</title>
<style>
.item-size {
	border: 3px solid lightgray;
	border-radius: 10px;
}

th, td {
	text-align: center;
}

@media ( min-width : 968px) {
	tbody {
		font-size: 18px;
	}
}

.noresize {
	width: 100%;
	height: 100px;
	resize: none; /* 사용자 임의 변경 불가 */
	/* resize: both; */ /* 사용자 변경이 모두 가능 */
	/* resize: horizontal; */ /* 좌우만 가능 */
	/* resize: vertical; */ /* 상하만 가능 */
}

@media ( max-width : 968px) {
	#sel {
		font-size: 1em;
	}
}
.detail{
	border-top:2px solid lightgray;
}
.detail:last-child {
	border-bottom:2px solid lightgray;
}
@media(max-width:576px){
.content{
	text-align:center;
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
				<li>
				<a href="#" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="Good">
					<i class="fa fa-bar-chart-o"></i> </a></li>
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
					<c:if test="${pageCode=='I'}">
					<!-- 메인내용 들어갈 공간 -->
					
						<div class="container">
							<h2>1:1 문의</h2>
						
							<div class="col-md-12 col-xs-12 detail">
								<div class="col-md-2 col-xs-5 title">
									<h4 style="color:crimson;">제목</h4>
								</div>
								<div class="col-md-10 col-xs-7">
									<h4 style="line-height: 1.5;">
										<c:choose>
											<c:when test="${one.bReply=='1'}">
												<span class="label label-success" style="margin-right: 10px;">답변대기중</span>
											</c:when>
											<c:when test="${one.bReply!='0' and one.bReply!='1'}">
												<span class="label label-danger" style="margin-right: 10px;">답변완료</span>
											</c:when>
										</c:choose>
										<div style="display:inline;">
										<div style="display:inline-block;" id="titleDiv">${one.bTitle}</div>
											<div id="bTitleTextArea" style="display:none;">
												<input class="form-control input-sm" value="${one.bTitle}"name="bTitle" id="bTitle">
											</div>
										</div>
									</h4>
								</div>
								<div class="col-md-2 col-xs-5">
									<h4 style="color:crimson;">작성자 ID</h4>
								</div>
								<div class="col-md-10 col-xs-7"> 
									<h4>${one.member_mId}</h4>
								</div>
								<div class="col-md-2 col-xs-5">
									<h4 style="margin-top: 0px; color:crimson;">분류</h4>
								</div>
								<div class="col-md-10 col-xs-7">
									
									<c:choose>
										<c:when test="${one.bSeparation=='0'}">
											<h4 style="margin-top: 0px;">[건의 사항]</h4>
										</c:when>
										<c:when test="${one.bSeparation=='1'}">
											<h4 style="margin-top: 0px;">[구매 관련]</h4>
										</c:when>
										<c:when test="${one.bSeparation=='2'}">
											<h4 style="margin-top: 0px;">[배송 관련]</h4>
										</c:when>
										<c:when test="${one.bSeparation=='3'}">
											<h4 style="margin-top: 0px;">[결제 문의]</h4>
										</c:when>
										<c:when test="${one.bSeparation=='4'}">
											<h4 style="margin-top: 0px;">[기타]</h4>
										</c:when>
									</c:choose>
								</div>
								</div>
								<div class="col-md-12 col-xs-12 detail"
									style="min-height: 250px; font-size: 1.2em; max-height: 400px; overflow: auto; padding-top: 15px;">
									<div class="col-md-2 col-xs-12 text-left content" style="color:crimson;"><h4>문의내용</h4>
									</div>
									<div class="col-md-8 col-xs-12" style="display:block;" id="contentDiv">
											${one.bContent}
									</div>
									<div class="col-md-8 col-xs-12" style="display:none;" id="bContentTextArea">
										<textarea rows="5" cols="10" id="bContent" style="width:125%;" value="${one.bContent}">${one.bContent}</textarea>									
									</div>
								</div>
								<div class="col-md-12 col-xs-12 text-left detail"
									style="margin-top: 20px; max-height: 350px; overflow: auto;">
									<div class="col-md-2 col-xs-12 text-left content" style="color:crimson;"><h4>답변내용</h4></div>
									<div class="col-md-10 col-xs-12" style="margin-top:10px;">
									<c:choose>
									
										<c:when test="${one.bReply!='0' and one.bReply!='1'}">
											<div>
												${one.bReply}
											</div>
										</c:when>
									
										<c:when test="${one.bReply=='0' or one.bReply=='1'}">
											<c:choose>
												<c:when test="${logInUser.mGrade=='A'}">
													<textarea id="replyText" rows="15" cols="20" style="width:100%;"></textarea>	
												</c:when>
												<c:when test="${logInUser.mGrade=='C'}">
													등록된 답변이 없습니다.
												</c:when>
											</c:choose>	
										</c:when>
										
									</c:choose>
									</div> 
									
								</div>
							<c:choose>	
								<c:when test="${logInUser.mGrade=='C'}">
									<c:if test="${one.bReply=='0' or one.bReply=='1'}">
										 <input type="button"  class="btn btn-primary pull-right" onclick="deleteButton('I')" value="삭제하기"/>
										 <input type="button" id="btn1" class="btn btn-primary pull-right" style="display:inline-block;"onclick="updateButton1()" value="수정하기"/>
										 <input type="button" id="btn2" class="btn btn-primary pull-right" style="display:none;" onclick="updateButton2()" value="수정완료"/>
									</c:if>
								</c:when>	
								<c:when test="${logInUser.mGrade=='A'}">
									<input type="button" class="btn btn-primary pull-right" style="margin-top:10px;" onclick="updateReply(${one.bNum})" value="답변하기"/>
								</c:when>
							</c:choose>
						</div>
					</c:if>
					
					<c:if test="${pageCode=='S'}">
						<!-- 메인내용 들어갈 공간 -->
						<div class="container">
						
							<h2>건의 사항</h2>
							
							<div class="col-md-12 col-xs-12 detail">
								<div class="col-md-2 col-xs-5 title">
									<h4 style="color:crimson;">제목</h4>
								</div>
								<div class="col-md-10 col-xs-7">
									<h4 style="line-height: 1.5;">
										${one.bTitle}
									</h4>
								</div>
								<div class="col-md-2 col-xs-5">
									<h4 style="color:crimson;">작성자 ID</h4>
								</div>
								<div class="col-md-10 col-xs-7">
									<h4>${one.member_mId}</h4>
								</div>
								</div>
								<div class="col-md-12 col-xs-12 detail"
									style="min-height: 250px; font-size: 1.2em; max-height: 400px; overflow: auto; padding-top: 15px;">
									<div class="col-md-2 col-xs-12 text-left content" style="color:crimson;"><h4>건의내용</h4>
									</div>
									<div class="col-md-8 col-xs-12">
											${one.bContent}
									</div>
								</div>
								 
							
							<c:choose>	
								<c:when test="${logInUser.mGrade=='C'}">
									 <input type="button"  class="btn btn-primary pull-right" onclick="deleteButton('S')" value="삭제하기"/>
								</c:when>
							</c:choose>
						
						</div>
					</c:if>
						
						
						
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
	<script>
	function updateReply(number){
		var bReply = $('#replyText').val();
		var bNum = number;
		$.ajax({
			type:'Post',
			url:'bReplyUpdate',
			data:{
				bReply:bReply,
				bNum:bNum
			},
			success:function(result){
				if(result.code=='100'){
					location.reload();
				}else if(result.code=='101'){
					
				}
			} // success
		});//ajax
	};//replyButton
	
	function deleteButton(pageCode){
		if(confirm("정말 삭제하시겠습니까?")==true){
		var bNum=${one.bNum};
		$.ajax({
			type:'post',
			url:'boardDelete',
			data:{
				bNum:bNum,
				pageCode:pageCode
			},
			success:function(result){
				if(result.page=='I'){
					window.location.replace('mCustomerInquiry');
				}else if(result.page=='S'){
					window.location.replace('mSuggestions');
				}
			}
			
			
		})//ajax
		}else{
			return;
		}
	};//deleteButton
	
	function updateButton1(){
		$('#titleDiv').css('display','none');
		$('#bContentTextArea').css('display','block');
		$('#contentDiv').css('display','none');
		$('#bTitleTextArea').css('display','inline');
		$('#btn1').css('display','none');
		$('#btn2').css('display','inline');
		
		
	}//updateButton
	
	function updateButton2(){
		var bNum=${one.bNum};
		var bTitle=$('#bTitle').val();
		var bContent=$('#bContent').val();
		
		$.ajax({
			type:'post',
			url:'boardUpdate',
			data:{
				bNum:bNum,
				bTitle:bTitle,
				bContent:bContent
			},
			success:function(result){
				if(result.code=='100'){
					alert('수정되었습니다.');
					window.location.reload();
				}else if(result.code=='101'){
					alert('오류가 발생했습니다.');
				}
			}	
		
			
		});//ajax
		
		
		
	}//updateButton2
	
	
	
	
	
	</script>
</body>
<footer>
	<div class="article">
		<jsp:include page="../footer.jsp" />
	</div>
</footer>
</html>