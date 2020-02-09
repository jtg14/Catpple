<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<title>주문완료 | Catpple</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="resources/custom/addCSS/footer.css">
<link rel="stylesheet" href="resources/custom/addCSS/header.css">
<link rel="stylesheet" href="resources/custom/addCSS/checkbox.css">
<link
	href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean"
	rel="stylesheet">
<style>
.font-Jua {
	font-family: Jua;
}

.order-card {
	width: 72;
	height: 72;
}

.current-status {
	border-bottom: 5px solid deepskyblue;
	border-radius: 3px;
}

.order-item {
	border: 4px solid lightgray;
	border-radius: 2em;
	margin-bottom: 20px;
	margin-top: 20px;
}

.div-bgcolor-lightgray {
	background-color: lightgray;
}

.div-bgcolor-white {
	background-color: white;
}

.table-head {
	width: 80px;
}
</style>
</head>
<body>
	<c:set var="listSize" value="${fn:length(list)}" />
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="container ">
		<!-- 주문완료 -->
		<div class="col-md-6 col-xs-12">
			<div class="col-md-2 col-md-offset-1 col-xs-3 text-center">
				<img class="order-card" src="resources/images/order.png">
			</div>
			<div class="col-md-4 col-xs-9 text-center">
				<h1>주문결제</h1>
			</div>
		</div>
		<!-- 장바구니,주문/결제,주문종류 -->
		<div class="col-md-6 col-xs-12 text-center"
			style="padding-right: 0px; padding-left: 0px;">
			<h3 class="h3">
				<span>장바구니</span> > <span class="current-status">주문/결제</span> > <span>주문완료</span>
			</h3>
		</div>
	</div>
	<!-- 경계선 -->
	<span id="course-divider"><hr></span>
	<!-- 결제 정보 단위 -->
	<div class="container">
		<div class="col-md-6 col-xs-12">
			<h4 class="h4">주문상품 확인 및 할인적용</h4>
		</div>
		<div class="col-md-4 col-xs-12">
			<h5 class="h5 text-right">*상품수량 및 옵션변경은 장바구니에서 가능합니다.</h5>
		</div>
		<div class="col-md-2 col-xs-12 text-center">
			<button class="btn btn-default" style="margin-left: 20;"
				type="button" onclick="javascript:history.back(1)">이전 페이지</button>
		</div>
	</div>
	<div class="container order-item">
		<!-- 상품 옵션정보-->
		<div class="col-md-6 col-xs-12"
			style="margin-left: 0px; margin-right: 0px; padding-left: 0px; padding-right: 0px;">
			<table class="table">
				<thead class="thead">
					<tr>
						<th>상품/옵션정보 (<span id="itemSize">${listSize}</span>)
						</th>
						<th style="width: 20%;">수량</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${list}">
						<tr>
							<td>${list.gname}</td>
							<td style="width: 20%;">${list.cAmount}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!--수량 ,상품금액,할인금액,할인적용금액 -->
		<div class="col-md-6 col-xs-12 text-center"
			style="margin-left: 0px; margin-right: 0px; padding-left: 0px; padding-right: 0px;">
			<table class="table">
				<thead>
					<tr>
						<th class="text-center">상품금액</th>
						<th class="text-center">할인금액</th>
						<th class="text-center">할인적용금액</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${list}" varStatus="status">
						<tr class="text-right">
							<td style="width: 35%" id="before${status.index}"><fmt:formatNumber
									value="${list.gprice * list.cAmount}" pattern="#,###" />원</td>
							<td>(-)0원</td>
							<td style="width: 35%" id="after${status.index}"><fmt:formatNumber
									value="${list.gprice * list.cAmount}" pattern="#,###" />원</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<!-- 주문확인 단위 -->
	<div class="container"
		style="border: 5px solid crimson; border-radius: 10px; padding: 20px;">
		<!-- price -->
		<div class="col-md-4 col-xs-12 div-bgcolor-lightgray">
			<div class="col-xs-6 text-left" style="padding-top: 5px;">주문금액</div>
			<div class="col-xs-6 text-right"
				style="padding-right: 0px; padding-left: 0px;">
				<span class="h3" id="before-total">690,000</span>원
			</div>
		</div>
		<!-- discount -->
		<div class="col-md-4 col-xs-12 div-bgcolor-lightgray">
			<div class="col-xs-6 text-left" style="padding-top: 5px;">할인사용금액</div>
			<div class="col-xs-6 text-right"
				style="padding-right: 0px; padding-left: 0px;">
				(-)<span class="h3">0</span>원
			</div>
		</div>
		<!-- total -->
		<div class="col-md-4 col-xs-12 div-bgcolor-lightgray">
			<div class="col-xs-6 text-left" style="padding-top: 5px;">최종결제금액</div>
			<div class="col-xs-6 text-right"
				style="padding-right: 0px; padding-left: 0px;">
				<span class="h3 after" id="after-total">690,000</span>원
			</div>
		</div>
		<!-- 추가 할인 및 포인트적용 -->
		<form role="form" id="order-form">
			<div class="col-md-6 col-xs-12 text-center"
				style="padding-top: 15px; padding-bottom: 20px;">
				<div class="col-md-3 col-xs-6" style="margin-top: 5px;">포인트사용</div>
				<div class="col-md-4 col-xs-6">
					<input class="form-control text-cente input-sm"
						style="width: 100; display: inline-block" type="number">
				</div>
				<div class="col-md-5 col-xs-12" style="margin-top: 5px;">
					보유포인트 : <span><fmt:formatNumber value="${logInUser.mPoint}"
							pattern="#,###" /></span>원
				</div>
			</div>
			<div class="container" style="padding-right: 0px; padding-left: 0px;">
				<div class="col-md-12 col-xs-12 text-center">
					<div class="col-md-2 col-xs-12">
						<span class="h3">배송지선택</span>
					</div>
					<div class="col-md-2 col-xs-6">
						<label> <input type="radio" id="default"
							name="quality[21]" value="1" /> 기본배송지
						</label>
					</div>
					<div class="col-md-2 col-xs-6">
						<label> <input type="radio" id="other" name="quality[21]"
							checked="checked" value="2" /> 직접입력
						</label>
					</div>
				</div>
				<div class="container">
					<div class="col-md-10 col-xs-12">
						<table class="table">
							<tbody>
								<tr>
									<td class="table-head">받으시는분</td>
									<td><input type="text" class="form-control input-sm"
										style="width: 100;"></td>
								</tr>
								<tr>
									<td class="table-head">주소</td>
									<td>
										<div class="col-md-2 col-xs-6" style="padding-left: 0px;">
											<input type="text" class="form-control input-sm"
												id="sample2_postcode" placeholder="우편번호"
												style="margin-bottom: 8px;">
										</div>
										<div class="col-md-10 col-xs-6" style="margin-bottom: 8px;">
											<input type="button" onclick="sample2_execDaumPostcode()"
												value="우편번호 찾기"><br>
										</div>
										<div class="col-md-7 col-xs-12" style="padding-left: 0px;">
											<input type="text" class="form-control input-sm"
												id="sample2_address" placeholder="주소"
												style="margin-bottom: 8px;"><br>
										</div>
										<div class="col-md-7 col-xs-12" style="padding-left: 0px;">
												<input type="text" id="sample2_detailAddress"
												placeholder="상세주소">
												<input type="text"
												id="sample2_extraAddress" placeholder="참고항목">
										</div>
										<div id="layer"
											style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
											<img
												src="//t1.daumcdn.net/postcode/resource/images/close.png"
												id="btnCloseLayer"
												style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
												onclick="closeDaumPostcode()" alt="닫기 버튼">
										</div>
									</td>
								</tr>
								<tr>
									<td>휴대전화</td>
									<td>
										<div class="col-md-4 col-xs-12" style="padding-left: 0px;">
											<input type="text" class="form-control input-sm"
												placeholder="휴대폰 번호">
										</div>
									</td>
								</tr>
								<tr>
									<td>배송메모</td>
									<td>
										<div class="col-md-8 col-xs-12" style="padding-left: 0px;">
											<input type="text" id="delivery"
												class="form-control input-sm" maxlength="49">
										</div>
										<div class="col-md-3 col-xs-12">
											<span id="currentLength">0</span>/50<span
												style="marin-left: 10px;">최대 50자</span>
										</div>
									</td>
								</tr>
								<tr>
									<td>주문자</td>
									<td>
										<div class="col-md-3 col-xs-12 text-center">${logInUser.mName}</div>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="panel-group" id="accordion" role="tablist"
							aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<h4 class="panel-title">
										<input type="checkbox"> <a data-toggle="collapse"
											data-parent="#accordion" href="#collapseOne"
											aria-expanded="true" aria-controls="collapseOne">개인정보 판매자
											제공에 동의 합니다.</a>
									</h4>
								</div>
								<div id="collapseOne" class="panel-collapse collapse in"
									role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">고객님께서는 아래 내용에 대하여 동의를 거부하실 수 있으며,
										거부시 상품 배송, CS가 제한됩니다.</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingTwo">
									<h4 class="panel-title">
										<input type="checkbox"> <a class="collapsed"
											data-toggle="collapse" data-parent="#accordion"
											href="#collapseTwo" aria-expanded="false"
											aria-controls="collapseTwo"> 개인정보 수집 및 이용에 동의 합니다. </a>
									</h4>
								</div>
								<div id="collapseTwo" class="panel-collapse collapse"
									role="tabpanel" aria-labelledby="headingTwo">
									<div class="panel-body">고객님께서는 아래 내용에 대하여 동의를 거부하실 수 있으며,
										거부 시 상품배송, 구매 및 결제, 일부 포인트 적립이 제한됩니다. 수집이용목적 수집 항목 보유기간 대금
										결제/환불 서비스 제공, 주문/배송/거래 내역 조회 서비스 제공, 전자상거래법 준수 등 신용카드 정보, 계좌
										정보, 주문/배송/거래 내역 회원탈퇴 시 까지 단, 관계 법령의 규정에 따라 보존할 의무가 있으면 해당 기간
										동안 보존 상품 및 경품(포인트, 쿠폰 포함) 배송(반품/환불/취소등), 배송지 확인, 최초 입력 후 불러오기
										기능 제공 아이디, 배송지 정보 (수령인,전화번호,주소), 현관비밀번호(입력시) 회원탈퇴 시 까지 단, 관계
										법령의 규정에 따라 보존할 의무가 있으면 해당 기간 동안 보존 이용계약(이용약관)이 존속중인 탈퇴하지 않은
										회원의 경우 보유기간은 보존의무기간 이상 보관할 수 있으며 이 기간이 경과된 기록에 대해서 파기요청이 있는 경우
										파기함 결제수단에 따른 개인정보 수집.이용 항목이 상이할 수 있음</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingThree">
									<h4 class="panel-title">
										<input type="checkbox"> <a class="collapsed"
											data-toggle="collapse" data-parent="#accordion"
											href="#collapseThree" aria-expanded="false"
											aria-controls="collapseThree"> 주문 상품 정보에 동의</a>
									</h4>
								</div>
								<div id="collapseThree" class="panel-collapse collapse"
									role="tabpanel" aria-labelledby="headingThree">
									<div class="panel-body">주문 상품의 상품명, 가격, 배송정보에 동의합니다.</div>
								</div>
							</div>
						</div>
						<!-- 이용동의 탭  -->
						<div class="col-md-12 col-xs-12">
							<h4>
								<input type="checkbox"><span style="margin-left: 20px;">위
									내용을 확인 했으며 모든 내용에 동의 합니다</span>
							</h4>
						</div>

					</div>
				</div>
			</div>
			<div class="col-md-6 col-xs-6 text-center">
				<button type="button" class="btn btn-danger">구매하기</button>
			</div>
			<div class="col-md-6 col-xs-6 text-center">
				<button type="button" class="btn btn-default">취소하기</button>
			</div>
		</form>
	</div>


	<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/custom/addJS/order.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }

    function sample2_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample2_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample2_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample2_postcode').value = data.zonecode;
                document.getElementById("sample2_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample2_detailAddress").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    }

    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition(){
        var width = 300; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
</script>
	<div class="article">
		<jsp:include page="../footer.jsp"></jsp:include>
	</div>
</body>
</html>
g
