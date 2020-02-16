$(function()
{    
   // 아이디
	var idregex = /^[a-zA-Z0-9]*$/;
	 $.validator.addMethod("validid", function( value, element ) {
	       return this.optional( element ) || idregex.test( value );
	 }); 
   // 이름 
   var nameregex = /^[가-힣]*$/;
   $.validator.addMethod("validname", function( value, element ) {
       return this.optional( element ) || nameregex.test( value );
   });
   
   // 이메일
   var eregex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
   
   $.validator.addMethod("validemail", function( value, element ) {
       return this.optional( element ) || eregex.test( value );
   });
   //연락처
   var phoneregex = /^01(?:0|1|[6-9]&\d{7}|\d{8})+$/;
   
   $.validator.addMethod("validphone", function( value, element ) {
       return this.optional( element ) || phoneregex.test( value );
   });
   
   var passwordregex = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,16}$/;
   
   $.validator.addMethod("validpassword", function( value, element ) {
       return this.optional( element ) || passwordregex.test( value );
   });
   
   $("#register-form").validate({
     
    rules:
    {
    id: {
    required: true,
    validid: true,
    minlength: 5,
    maxlength: 16
    },
    name: {
     required: true,
     validname: true,
     minlength: 2
    },
    email: {
        required: true,
        validemail: true
       },
    phone: {
     required: true,
     validphone: true,
     minlength:10,
     maxlength:11
	    },
    password: {
     required: true,
     validpassword:true,
     minlength: 8,
     maxlength: 16
    },
    cpassword: {
     required: true,
     equalTo: '#password'
    },
     },
     messages:
     {
    id: {
        required: "아이디 입력은 필수 항목 입니다",
        validid: "아이디는 숫자,영문 조합 으로만 가능합니다.",
        minlength: "아이디는 최소 5글자 부터 가능합니다.",
        maxlength: "아이디는 최대 16글자 까지 가능합니다."
          },
    name: {
     required: "이름 입력은 필수 항목 입니다.",
     validname: "이름은 한글만 가능합니다  ",
     minlength: "최소 두자 부터 가능합니다."
       },
    email: {
    required: "이메일 입력은 필수항목 입니다.",
    validemail: "이메일 형식에 맞게 입력해주세요."
    },
    phone: {
    required: "연락처 입력은 필수 항목 입니다.",
    validphone: "연락처 형식에 맞에 -를 제외하고 입력해주세요.",
    minlength: "연락처는 최소 12자 부터 가능합니다.",
    maxlength: "연락처는 최대 13자 까지 가능합니다."
     },
    password:{
     required: "비밀번호 입력은 필수 항목 입니다.",
     validpassword: "비밀호는 특수문자+숫자+영문을포함하여 최대8~16자까지 가능합니다",
     minlength: "비밀번호는 영문+특수문자+숫자를 포함하여 최소 8자 부터 가능합니다.",
     maxlength: "비밀번호는 영문+특수문자+숫자를 포함하여 최대 16자 부터 가능합니다."
     },
    cpassword:{
     required: "비밀번호 확인은 필수 항목 입니다.",
     equalTo: "비밀 번호 와 일치 하지않습니다."
     }
     },
     errorPlacement : function(error, element) {
     $(element).closest('.form-group').find('.help-block').html(error.html());
     },
     highlight : function(element) {
     $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
     },
     unhighlight: function(element, errorClass, validClass) {
     $(element).closest('.form-group').removeClass('has-error').addClass('has-success');
     $(element).closest('.form-group').find('.help-block').html('');
     },
     
     submitHandler: function(form) {
    	 alert('회원가입에 성공하였습니다');
    	 form.submit();
                }
     }); 
   $('#idCheck').click(function(){
	   var checkId = $('#id').val();
	   if(checkId == ''){
		   alert('아이디를 입력해주세요');
		   return false;
	   }else{
   	$.ajax({
   		type:'Post',
   		url:'idCheck',
   		data:{
   			mId:checkId
   		},
   		success:function(data){
   			if(data.code == 200){
   				alert(checkId+'는 사용가능한 아이디입니다.');
   				$('#signUpbtn').removeClass('disabled');
   				idStatus = true;
   				$('#name').focus();
   			}else if(data.code == 201){
   				alert(checkId +'는 이미사용중인 아이디입니다!');
   				$('#signUpbtn').addClass('disabled');
   				
   			}
   		}
   	});
	   }
   });//end of idcheck
   $('#phoneCheck').click(function(){
	   var checkPhone = $('#phone').val();
	   if(checkPhone == ''){
		   alert('휴대폰 번호를 입력해주세요');
		   return false;
	   }else{
   	$.ajax({
   		type:'Post',
   		url:'phoneCheck',
   		data:{
   			mPhone:checkPhone
   		},
   		success:function(data){
   			if(data.code == 200){
   				alert('인증번호가 발송되었습니다. !');
   				$('#verifyBtn').removeClass('disabled');
   			}else if(data.code == 201){
   				alert('올바른 정보를 입력해주세요!');
   			}
   		}
   	});
	   }
   });//end of phonecheck
   var phoneVerifyCheck = false;
   $('#verifyBtn').click(function(){
		var verifyNumber = $('#phoneVerify').val();
		$('#phoneCheck').addClass('disabled');
		$.ajax({
				type:'Post',
				data:{
					verifyNumber:verifyNumber
				},
				url:'vPhone',
				success:function(data){
					if(data.code == '100'){
						alert('인증 되었습니다.');
						phoneVerifyCheck = true;
					}else if(data.code == '101'){
						if(confirm('인증번호가 일치하지않습니다. 다시하시겠습니까?')){
							$('#phoneCheck').removeClass('disabled');
			   				$('#phoneVerify').removeClass('disabled');
						}else{
							alert('취소 되었습니다.');
						}
					}
				}
		});
		
	});
   
   $('#id').focus(function(){
		$('#signUpbtn').addClass('disabled');
   });
   
  
 });// end of ready
function signUpGo(){
	if($('input:checkbox[id="defaultUnchecked"]').is(":checked") == false){
		   alert('정보제공동의 및 이용동의에 동의 해주셔야 가입이 가능합니다.');
		   return false;
	   }else if($('input:radio[name=options]').is(':checked') == false){
		   alert('구매자 및 판매자 항목을 선택해주셔야합니다.');
		   return false;
	   }else if(phoneVerifyCheck == false){
	   alert('휴대폰 인증을 하셔야 가입이 가능합니다.');
	   return false;
	   }else if($('#id').val() != null && $('#name').val() != null && $('#email').val() != null && 
			   $('#phone').val() != null && $('#password').val() != null){
		   return true;
	   }
}


function purchase(grade,id,number){//상품 디테일에서구매
	if(grade == ''){
		alert('로그인이 필요한 서비스입니다.');
		window.location.href = 'logInf';
	}else if(grade == 'S'){
		alert('판매자로 등록된 계정은 구매할수없습니다.');
	}else if(confirm('정말 구매 하시 겠습니까?')){
		$.ajax({
			 type:'Post',
			 url:'cTOrder',
			 data:{
				 cAmount:$('#amount1').val(),
				 member_mId:id,
				 goods_gNum:number
			 },
			 success:function(data){
				 location.href='oinfo';
			 }
		});
	}else{
		alert('구매가 취소되었습니다.');
	}
}
function goCart(grade,id,number){
	if(grade == ''){
		alert('로그인이 필요한 서비스입니다.');
		window.location.href = 'logInf';
	}else if(grade == 'S'){
		alert('판매자로 등록된 계정은 장바구니를 이용 할 수 없습니다.');
	}else{
		if(confirm('해당 상품을 장바구니에 담으시겠습니까?')){
			$.ajax({
				type:'Post',
				url:'infoToCart',
				data:{
					cAmount:$('#amount1').val(),
					member_mId:id,
					goods_gNum:number
				},
				success:function(data){
					if(data.code == '100'){
						if(confirm('장바구니에 넣었습니다 계속 쇼핑 하시겠습니까?')){
							return false;
						}else{
							location.href = 'mCart';
						}
					}else if(data.code == '101'){
						alert('이미 장바구니에 있는 상품 입니다.');
					}
				}
			});
		}else{
			alert('취소 되었습니다.');
		};
	};
	
}
