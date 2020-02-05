
$(function(){
	// 유효성검사
	// 변수선언
	var c_firstSelect = false;
	var c_goodsName = false;
	var c_gprice = false;
	var c_goodsAmount = false;
	var c_uploadfilef = false;
	var c_uploadfilef2 = false;
	
	// 포커스아웃설정
	$('#firstSelect').focusout(function(){
		c_firstSelect = cf_firstSelect();
	});
	$('#secondSelect').focusout(function(){
		$('#goodsName').focus();
	});
	$('#goodsName').focusout(function(){
		c_goodsName = cf_goodsName();
	});
	$('#gprice').focusout(function(){
		c_gprice = cf_gprice();
	});
	$('#goodsAmount').focusout(function(){
		c_goodsAmount = cf_goodsAmount();
	});
	$('#uploadfilef').focusout(function(){
		c_uploadfilef = cf_uploadfilef();
	});
	$('#uploadfilef2').focusout(function(){
		c_uploadfilef2 = cf_uploadfilef2();
		inCheck();
	});
	
	var firstList = new Array("사료","캔/간식","장난감","화장실/매트");

	// 소분류

	var secondList1 = new Array("고양이처방식","노묘용","성묘용","자묘용","전연령용");
	var secondList2 = new Array("간식캔","주식캔","스낵","건조간식","통살");
	var secondList3 = new Array("낚싯대", "막대", "인형/쿠션", "공", "박스/하우스");
	var secondList4 = new Array("하우스화장실", "평판화장실", "화장실매트","거름망","배변패드");
	// 페이지 로딩시 자동 실행
    var v_firstSelect = document.getElementById("firstSelect"); // SELECT TAG
      
    for (i =0 ; i<firstList.length; i++){
        // 새로운 <option value=''>값</option> 태그 생성
        var optionEl = document.createElement("option");
  
        // option태그에 value 속성 값으로 저장
        optionEl.value = firstList[i];
      
        // text 문자열을 새로 생성한 <option> 태그의 값으로 추가
        optionEl.appendChild (document.createTextNode(firstList[i]));
      
        // 만들어진 option 태그를 <select>태그에 추가
        v_firstSelect.appendChild(optionEl);
    }
  
    var v_secondSelect = document.getElementById("secondSelect"); // SELECT
																	// TAG
    v_secondSelect.style.display = "none"; 
  
	
});
function checkfile(){
	var img1 = $('#uploadfilef').val().substring($('#uploadfilef').val().lastIndexOf('.'),$('#uploadfilef').val().length);
	var img2 = $('#uploadfilef2').val().substring($('#uploadfilef2').val().lastIndexOf('.'),$('#uploadfilef2').val().length);
	
	if(img1 != '.jpg' && img1 != '.png' && img2 != '.jpg' && img2 != '.png'){
		alert('대표이미지와 상품이미지는 jpg 파일 또는 png 파일만 가능합니다.');
		return false;
	}

	
}
function changeFirstSelect(){
    var v_firstSelect = document.getElementById("firstSelect"); // SELECT TAG
    var idx = v_firstSelect.options.selectedIndex;     // 선택값 0 ~ 4
     

    if (idx < 1 && idx > 4){
        return;
    }
 
    secondSelectFill(idx);   // 중분류 생성
}
function cf_firstSelect(){
	if($('#firstSelect').val()!==''){
		$('#secondSelect').focus();
		return true;
	} else {
		alert('대분류를 지정해주세요.');
		return false;
	}
}
function cf_goodsName(){
	if($('#goodsName').val()!==''){
		$('#gprice').focus();
		return true;
	} else {
		alert('상품이름을 입력해주세요.');
		return false;
	}
}
function cf_gprice(){
	if($('#gprice').val()!==''){
		$('#goodsAmount').focus();
		return true;
	} else {
		alert('상품가격을 입력해주세요.');
		return false;
	}
}
function cf_goodsAmount(){
	if($('#goodsAmount').val()!==''){
		$('#uploadfilef').focus();
		return true;
	} else {
		alert('상품수량을 입력해주세요.');
		return false;
	}
}
function cf_uploadfilef(){
	if($('#uploadfilef').val()!==''){
		$('#upfMessage').html('');
		$('#uploadfilef2').focus();
		return true;
	} else {
		$('#upfMessage').html('상품의 이미지를 올려주세요.');
		return false;
	}
}
function cf_uploadfilef2(){
	if($('#uploadfilef2').val()!==''){
		$('#upfMessage2').html('');
		return true;
	} else {
		$('#upfMessage2').html('상품의 내용에 대한 이미지를 올려주세요.');
		return false;
	}
}
function inCheck(){
	if(c_firstSelect == true && c_goodsName == true && c_gprice == true && c_goodsAmount == true
	&& c_uploadfilef == true && c_uploadfilef2 == true) {
		$('#upfMessage2').html('상품을 등록합니다.');
		$('#gis').attr('disabled', false);
	} else {
		$('#upfMessage2').html('입력사항을 확인해주세요.');
	}
}
function secondSelectFill(idx){
    var v_secondSelect = document.getElementById("secondSelect"); // SELECT
																	// TAG
 
    var data = null;
  
    if (idx == 0) {
        v_secondSelect.style.display = "none";  // 중분류 태그 감추기
        return;
    }
  
    if (idx == 1){
     data = secondList1
   
     }
    if (idx == 2){
     data = secondList2
     
     }
    if (idx == 3){
    	data = secondList3
    }
    if (idx == 4 ){
    	data = secondList4
    }

    v_secondSelect.innerHTML = "";  // 태그 출력
      
    for (i =0 ; i<data.length; i++){ 
        // 새로운 <option value=''>값</option> 태그 생성
        var optionEl = document.createElement("option");
  
        // value 속성 태그에 저장
        optionEl.value = data[i];
      
        // text 문자열을 새로 생성한 <option> 태그에 추가
        optionEl.appendChild (document.createTextNode(data[i]));
      
        // 만들어진 option 태그를 <select>태그에 추가
        v_secondSelect.appendChild(optionEl);
    }
  
v_secondSelect.style.display = ""; // 중분류 태그 출력
 
	
	// 함수들
}