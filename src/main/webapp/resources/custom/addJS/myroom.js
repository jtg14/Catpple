$(function(){
    $('[data-toggle="tooltip"]').tooltip();
    $(".side-nav .collapse").on("hide.bs.collapse", function() {                   
        $(this).prev().find(".fa").eq(1).removeClass("fa-angle-right").addClass("fa-angle-down");
    });
    $('.side-nav .collapse').on("show.bs.collapse", function() {                        
        $(this).prev().find(".fa").eq(1).removeClass("fa-angle-down").addClass("fa-angle-right");        
    });
    
    $('#menu1').click(function(){
    	$.ajax({
			type:'Get',
			url:'mpoint',
			success:function(result){
				$('#main').html();
				$('#main').html(result);
			}
		}); //ajax 
    });
    $('#menu2').click(function(){
    	$.ajax({
			type:'Get',
			url:'mEPoint',
			success:function(result){
				$('#main').html();
				$('#main').html(result);
			}
		}); //ajax 
    });
    $('#menu3').click(function(){
    	$.ajax({
			type:'Get',
			url:'mODelivery',
			success:function(result){
				$('#main').html();
				$('#main').html(result);
			}
		}); //ajax 
    });
    $('#menu4').click(function(){
    	$.ajax({
			type:'Get',
			url:'mOCancel',
			success:function(result){
				$('#main').html();
				$('#main').html(result);
			}
		}); //ajax 
    });
    $('#menu5').click(function(){
    	$.ajax({
			type:'Get',
			url:'mRExchange',
			success:function(result){
				$('#main').html();
				$('#main').html(result);
			}
		}); //ajax 
    });
    $('#menu6').click(function(){
    	$.ajax({
			type:'Get',
			url:'mCart',
			success:function(result){
				$('#main').html();
				$('#main').html(result);
			}
		}); //ajax 
    });
    $('#menu7').click(function(){
    	$.ajax({
			type:'Get',
			url:'blist',
			success:function(result){
				$('#main').html();
				$('#main').html(result);
			}
		}); //ajax 
    });
    $('#menu8').click(function(){
    	$.ajax({
			type:'Get',
			url:'mFAQ',
			success:function(result){
				$('#main').html();
				$('#main').html(result);
			}
		}); //ajax 
    });
    $('#menu9').click(function(){
    	$.ajax({
			type:'Get',
			url:'mSuggestions',
			success:function(result){
				$('#main').html();
				$('#main').html(result);
			}
		}); //ajax 
    });
    $('#menu10').click(function(){
    	$.ajax({
			type:'Get',
			url:'mChange',
			success:function(result){
				$('#main').html();
				$('#main').html(result);
			}
		}); //ajax 
    });
    $('#menu11').click(function(){
    	$.ajax({
			type:'Get',
			url:'mWdrawal',
			success:function(result){
				$('#main').html();
				$('#main').html(result);
			}
		}); //ajax 
    });
    $('#menu12').click(function(){
    	$.ajax({
			type:'Get',
			url:'mWriting',
			success:function(result){
				$('#main').html();
				$('#main').html(result);
			}
		}); //ajax 
    });
    $('#menu13').click(function(){
    	$.ajax({
			type:'Get',
			url:'sGForm',
			success:function(result){
				$('#main').html();
				$('#main').html(result);
			}
		}); //상품등록
    });
    $('#menu14').click(function(){
    	$.ajax({
			type:'Get',
			url:'sGUForm',
			success:function(result){
				$('#main').html();
				$('#main').html(result);
			}
		}); //상품 등록 수정
    });
    $('#menu15').click(function(){
    	$.ajax({
			type:'Get',
			url:'sRGoods',
			success:function(result){
				$('#main').html();
				$('#main').html(result);
			}
		}); //내가 등록한 상품 
    });
    $('#menu16').click(function(){
    	$.ajax({
			type:'Get',
			url:'sOList',
			success:function(result){
				$('#main').html();
				$('#main').html(result);
			}
		}); //주문요청 목록
    });
    
    $('#binsert').click(function(){
		$.ajax({
			type:'Post',
			url:'binsert',
			data:{
				bTitle:$('#bTitle').val(),
				bContent:$('#bContent').val()
				
			},
			success:function(result){
				$('#main').html();
				$('#main').html(result);
			}	
		});//ajax
	});
    
    
});/*end of ready*/    
function BDetail() {
	$.ajax({
		type:'Get',
		url:'mBDetail',
		success:function(result){
			$('#main').html(result);
		} // success
	}); // ajax	
} // axBDetail    
