$(function(){
	var total = 0;
	var number = $('#itemSize').html();
	for(var i = 0;i < parseInt(number);i++){
		total += parseInt($('#before'+i).html().substring(0,$('#before'+i).html().length-1).replace(/\,/g,''));
	}
	$('#before-total').html(addCommas(total));
	$('#after-total').html(addCommas(total));
	
	$('#delivery').keyup(function(){
		var length = $('#delivery').val().length;
		$('#currentLength').html(length);
	});
	$('input:radio[name=destination]').click(function(){
		 
        if($('input[name=destination]:checked').val() == '1'){//기본 배송지 선택
        		$.ajax({
        			type:'Post',
        			url:'pMYAddr',
        			success:function(data){
        				$('#addressee').val(data.user.mName);
        				$('#sample2_postcode').val(data.user.mAddr1);//우편번호
        				$('#sample2_address').val(data.user.mAddr2);//도로명
        				$('#sample2_extraAddress').val(data.user.mAddr3);//아파트명
        				$('#sample2_detailAddress').val(data.user.mAddr4);//동호수
        				$('#phoneNumber').val(data.user.mPhone);//연락처
        			},
        			error:function(e){
        				alert(e.text());
        			}
        		});
        	
        }else if($('input[name=destination]:checked').val() == '2'){//직접 입력 선택

			$('#addressee').val('');
			$('#sample2_postcode').val('');//우편번호
			$('#sample2_address').val('');//도로명
			$('#sample2_extraAddress').val('');//아파트명
			$('#sample2_detailAddress').val('');//동호수
			$('#phoneNumber').val('');//연락처
        }
    });
   
});
function addCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
function goPurchase(){
 var addressee = $('#addressee').val();
 var addr1 = $('#sample2_postcode').val();
 var addr2 = $('#sample2_address').val();
 var addr3 = $('#sample2_extraAddress').val();
 var addr4 = $('#sample2_detailAddress').val();
 var phone = $('#phoneNumber').val();
 	if(addressee == '' ||addr1 == '' ||addr2 == '' ||addr3 == '' ||addr4 == ''){
 		alert('필수입력 사항을 입력 해주세요.');
 		return false;
 	}else if(phone == ''){
 		alert('연락처 기재는 필수입니다.');
 		return false;
 	}else if($('input:checkbox[id="agreeforOrder"]').is(':checked') == false){
 		alert('주문 상품 정보에 동의를 안하시면 구매하실수 없습니다.');
 	}else if($('input:checkbox[id=""lastAgree""]').is(':checked') == false){
 		alert('최종동의는 필수입니다.');
 		return false;
 	}else{
 		return true;
 	}
}
function cancelOrder(){
	if(confirm('주문을 정말 취소하시겠습니까? \n 취소하시면 장바구니로 돌아갑니다.')){
		alert('주문이 취소 되었습니다.');
		location.href='mCart';
	}else{
		return false;
	}
}