var firstList = new Array("사료", "캔,간식", "장난감", "화장실,매트");

// 중분류

var secondList1 = new Array("고양이처방식", "노묘용", "성묘용", "자묘용", "전연령용");
var secondList2 = new Array("간식캔", "주식캔", "스낵", "건조간식", "통살");
var secondList3 = new Array("낙싯대", "막대", "인형/쿠션", "공", "박스/하우스");
var secondList4 = new Array("하우스화장실", "평판화장실", "화장실매트", "거름망", "배변패드");

$(function() {
	var v_sidoSelect = document.getElementById("sidoSelect"); // SELECT TAG

	for (i = 0; i < firstList.length; i++) {// 0 ~ 3
		// 새로운 <option value=''>값</option> 태그 생성
		var optionEl = document.createElement("option");

		// option태그에 value 속성 값으로 저장
		optionEl.value = firstList[i];

		// text 문자열을 새로 생성한 <option> 태그의 값으로 추가
		optionEl.appendChild(document.createTextNode(firstList[i]));

		// 만들어진 option 태그를 <select>태그에 추가
		v_sidoSelect.appendChild(optionEl);
	}

	var v_gugunSelect = document.getElementById("gugunSelect"); // SELECT TAG
	v_gugunSelect.style.display = "none"; // 태그 감추기

});
function checkfile() {
	var img1 = $('#uploadfilef').val().substring(
			$('#uploadfilef').val().lastIndexOf('.'),
			$('#uploadfilef').val().length);
	var img2 = $('#uploadfilef2').val().substring(
			$('#uploadfilef2').val().lastIndexOf('.'),
			$('#uploadfilef2').val().length);
	
	if (img1 != '.jpg' && img1 != '.png' && img2 != '.jpg' && img2 != '.png' && img1 == '' && img2 == '' ) {
		alert('대표이미지와 상품이미지는 jpg 파일 또는 png 파일만 가능합니다.');
		return false;
	}else if($('#gugunSelect').val() == ''){
		alert('중분류및 소분류를 선택해주세요.');
		return false;
	}else if($('#uploadfilef').val() === $('#uploadfilef2').val()){
		alert('같은 파일은 등록할수없습니다.');
		return false;
	}else if($('#goodsName').val() == ''){
		alert('상품이름은 필수입력 사항입니다.');
		return false;
	}else if($('#gprice').val() == '' || $('#goodsAmount').val() == '' ){
		alert('상품 가격 및 갯수는 필수 입력 사항 입니다. ');
		return false;
	}else{
		 var form = $('#addGoodsForm');
		 var data = new FormData(form);
		 $('#gis').prop('disabled', true);
		$.ajax({
			type:'Post',
			enctype: 'multipart/form-data',
			url:'goodsInsert',
			data:data,
			processData: false,
            contentType: false,
            cache: false,
            timeout: 600000
		});
	}

}
function checkUpdateFile(number){
	if($('#gprice').val() == '' || $('#goodsAmount').val() == '' ){
		alert('상품 가격 및 갯수는 필수 입력 사항 입니다. ');
	}else{
		if(confirm('정말 수정하시겠습니까?')){
			$.ajax({
				type:'Post',
				url:'gupdate',
				data:{
					gNum:number,
					gStock:$('#goodsPrice').val(),
					gPrice:$('#goodsAmount').val()
				},
				success:function(data){
					if(data.code == '100'){
						alert('정상적으로 수정되었습니다.');
						location.href='sRGoods';
					}else if (data.code == '101'){
						alert('수정에 실패하였습니다.');
					}
				}
			});
		}else{
			alert('취소 되었습니다.');
		}
	}
}
function changeSidoSelect() {
	var v_sidoSelect = document.getElementById("sidoSelect"); // SELECT TAG
	var idx = v_sidoSelect.options.selectedIndex; // 선택값 0 ~ 3

	if (idx < 1 && idx > 3) {
		return;
	}

	gugunSelectFill(idx); // 중분류 생성
}

function gugunSelectFill(idx) {
	var v_gugunSelect = document.getElementById("gugunSelect"); // SELECT TAG

	var data = null;

	if (idx == 0) {
		v_gugunSelect.style.display = "none"; // 중분류 태그 감추기
		return;
	}

	if (idx == 1) {
		data = secondList1

	}
	if (idx == 2) {
		data = secondList2

	}
	if (idx == 3) {
		data = secondList3

	}
	if (idx == 4) {
		data = secondList4

	}

	v_gugunSelect.innerHTML = ""; // 태그 출력

	for (i = 0; i < data.length; i++) {
		// 새로운 <option value=''>값</option> 태그 생성
		var optionEl = document.createElement("option");

		// value 속성 태그에 저장
		optionEl.value = data[i];

		// text 문자열을 새로 생성한 <option> 태그에 추가
		optionEl.appendChild(document.createTextNode(data[i]));

		// 만들어진 option 태그를 <select>태그에 추가
		v_gugunSelect.appendChild(optionEl);
	}

	v_gugunSelect.style.display = ""; // 중분류 태그 출력

}

// 대분류 선택시
function changeSecondSelect() {
	var v_sidoSelect = document.getElementById("sidoSelect"); // SELECT TAG
	var v_secondSelect = document.getElementById("gugunSelect"); // SELECT
	// TAG
	var idx = v_sidoSelect.options.selectedIndex;
	var idx2 = v_secondSelect.options.selectedIndex; // 선택값 0 ~ 3

	// alert("select: " + selText);
	if (idx < 1 && idx > 3) {
		return;
	}

}

function checkFile(f){

	var file = f.files;
	if(!/\.(gif|jpg|jpeg|png)$/i.test(file[0].name)) {
		alert('gif, jpg, png 파일만 선택해 주세요.');
	} else if(/\[|\]/.test(file[0].name)){
		alert('파일명은 한글, 영어, 숫자를 사용해주세요.');
	} else {
		return;
	}
	f.outerHTML = f.outerHTML;
}