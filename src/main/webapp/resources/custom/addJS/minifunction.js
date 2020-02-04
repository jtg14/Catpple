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
				window.location.href = 'logInf';
				$('#id').focus();
			}
			}
		});
	}
	
}
function find(){//f
	var url="changePwf";
	// idDupCheck?id=banana
	window.open(url,"_blank"
		,"toolbar=no,menubar=yes,scrollbars=yes,resize=no,width=500px,height=200px,top=200,left=400;");
}
function confirmA(g){
	var passwordregex = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,16}$/;
	var p1 = $('#passwordChange').val();
	var p2 = $('#cpasswordChange').val();
	var reason;
	if(g == ''){
		alert('세션이 만료 되었습니다. 로그인을 해주시기 바랍니다.');
		opener.location.href = 'logInf';
		return false;
	}else if(!passwordregex.test($('#passwordChange').val())){
		alert('비밀번호는 숫자+영문+특수문자를 포함한 8 ~ 16 자 이내로 입력해주세요.');
		return false;
	}
	else if(p1 != p2){
		alert('비밀번호 와 비밀번호 확인은 일치해야 합니다.');
		return false;
	}else if(p1 == ''){
		alert('변경하실 비빌번호를 입력 해주세요.');
		return false;
	}else{
		$.ajax({
			type:'Post',
			url:'changePw',
			data:{
				id:g,
				password:p1,
			},
			success:function(data){
				if(data.code == '100'){
					alert('비밀번호를 변경하는데 성공 하였습니다. \n\n 변경 된 정보로 로그인 해주시기바랍니다.');
					opener.location.href = 'logInf';
					close();
				}else if (data.code == '101'){
					opener.alert('비밀번호를 변경하는데 실패 하였습니다');
				}
			}
			
		});
	}
}
function deleteCart(cid){
	if(confirm('정말 삭제 하시겠습니까?')){
		$.ajax({
			type:'Post',
			url:'deleteCart',
			data:{
				cId:cid
			},
			success:function(data){
				if(data.code == 300){
					alert('성공적으로 삭제했습니다.');
					location.reload();
				}else if (data.code == 301){
					alert('삭제에 실패 하였습니다.');
				}
			}
		});
	}else{
		return false;
	}
}
