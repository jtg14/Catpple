$(function()
{    
   // 아이디
	var idregex = /^[a-zA-Z0-9]*$/;
	 $.validator.addMethod("validid", function( value, element ) {
	       return this.optional( element ) || idregex.test( value );
	 }); 
   // 이름 
   var nameregex = /^[가-힇]*$/;
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
   var phoneCheck = false;
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
   				phoneCheck =true;
   				$('#name').focus();
   			}else if(data.code == 201){
   				alert('올바른 정보를 입력해주세요!');
   			}
   		}
   	});
	   }
   });//end of phonecheck
   
   
   $('#id').focus(function(){
		$('#signUpbtn').addClass('disabled');
   });
 });// end of ready
function signUpGo(){
	if($('input:checkbox[id="defaultUnchecked"]').is(":checked") == false){
		   alert('정보제공동의 및 이용동의에 동의 해주셔야 가입이 가능합니다');
		   return false;
	   }else if($('input:radio[name=options]').is(':checked') == false){
		   alert('구매자 및 판매자 항목을 선택해주셔야합니다.');
		   return false;
	   }else if(phoneCheck == false){
	   alert('휴대폰 인증을 하셔야 가입이 가능합니다.');
	   return false;
	   }else{
		   alert('회원가입성공!');
		   return true;
	   }
}
