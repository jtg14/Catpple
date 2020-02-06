$(function(){
    $('[data-toggle="tooltip"]').tooltip();
    $(".side-nav .collapse").on("hide.bs.collapse", function() {                   
        $(this).prev().find(".fa").eq(1).removeClass("fa-angle-right").addClass("fa-angle-down");
    });
    $('.side-nav .collapse').on("show.bs.collapse", function() {                        
        $(this).prev().find(".fa").eq(1).removeClass("fa-angle-down").addClass("fa-angle-right");        
    });
    
    
    
    
});/*end of ready*/    
function withDrawal(id,grade){
	if($('input:checkbox[name="agree"]').is(":checked") == false){
		alert('회원 탈퇴 유의사항을 읽어보시고 체크 해주시기 바랍니다.');
		return false;
	}else if(grade == 'S'){
		alert('판매자 계정은 탈퇴 할 수 없습니다.\n판매자 계정 탈퇴는 관리자에게 문의 하세요.');
		return false;
	}else if(confirm(id+' 계정을 정말 탈퇴 하시겠습니까?')){
		$.ajax({
			type:'Post',
			url:'mdelete',
			data:{
				mId:id
			},
			success:function(data){
			if(data.code == '100'){
				alert('탈퇴에 성공 하였습니다.');
				location.href ='home';
			}else if(data.code == '101'){
				alert('탈퇴에 실패 하였습니다.');
				
			}	
			}
		});
	}else{
		alert('탈퇴가 취소 되었습니다.');
		return false;
	}
}
