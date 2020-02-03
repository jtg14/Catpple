$(function() {
	$(window).scroll(function(){
		// 상단 Header고정
		if($(this).scrollTop() > 0) {
			$('#header').css({
				position: "fixed",
				top: 0
			});
			$('#top_margin').show();
		}
		if($(this).scrollTop() > 300) {
			$('#btn_top').fadeIn();
		} else {
			$('#btn_top').fadeOut();
		}
	});
	$('#btn_top').click(function(){
		$('html,body').animate({
			scrollTop: 0
		},200);
	});
	
	$('input:text[numberOnly]').on('keyup', function() {
		$(this).val($(this).val().replace(/[^0-9]/g,''));
	});
	$('#btn-minus').click(function(){
		$('#amount1').val($('#amount1').val()-1);
		$('#total').html(addCommas(parseInt($('#price').html()) * $('#amount1').val())+' 원');
		$('#amount1').focus();
		});
	$('#btn-plus').click(function(){
		$('#amount1').val(parseInt($('#amount1').val())+1);
		$('#total').html(addCommas(parseInt($('#price').html()) * $('#amount1').val())+' 원');
		$('#amount1').focus();
		});
	$('#amount1').focusout(function(){
		if($('#amount1').val()<=0){
			$('#amount1').val('1');
			$('#total').html(addCommas(parseInt($('#price').html()) * $('#amount1').val())+' 원');
			alert('주문수량은 최소 1개 입니다.');
		}else if($('#amount1').val()>parseInt($('#stock').html().substring(5,$('#stock').html().length-10))){
			alert('최대 갯수는 '+$('#stock').html().substring(5,$('#stock').html().length-10)+' 개 입니다.');
			$('#amount1').val('1');
			$('#total').html(addCommas(parseInt($('#price').html()) * $('#amount1').val())+' 원');
		}else if($('#amount1').val() >0 && $('#amount1').val() <9999){
			$('#total').html(addCommas(parseInt($('#price').html()) * $('#amount1').val())+' 원');
		}
	});
}); //ready
//3자리 단위마다 콤마 생성
function addCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
 
//모든 콤마 제거
function removeCommas(x) {
    if(!x || x.length == 0) return "";
    else return x.split(",").join("");
}
function logInCheck(){
	var id = $('#id').val();
	var password = $('#password').val();
	if(id == ''){
		alert('아이디를 입력 해주세요.');
	}else if (password == ''){
		alert('비밀번호를 입력 해주세요.');
	}else{
	$.ajax({
		type:'Post',
		url:'logIn',
		data:{
			mId:id,
			mPw:password
		},
		success:function(data){
			if(data.logIn == 'success'){
				alert('환영합니다. '+id+' 님');
				window.location.href = 'home';
			}else if(data.logIn == 'failed'){
				alert('등록 된 정보와 일치하지 않거나 \n\n 시스템에 없는 계정 입니다.');
				$('#id').focus();
				window.location.href = 'logInf';
			}
			}
		});
	}
	
}

