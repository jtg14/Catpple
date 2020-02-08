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
	$("input:radio[name=radio]").click(function(){
		 
        if($("input[name=radio]:checked").val() == "default"){//기본 배송지 선택
            $("input:text[name=text]").attr("disabled",false);
            // radio 버튼의 value 값이 1이라면 활성화
 
        }else if($("input[name=radio]:checked").val() == "0"){//직접 입력 선택
              $("input:text[name=text]").attr("disabled",true);
            // radio 버튼의 value 값이 0이라면 비활성화
        }
    });
});
function addCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
