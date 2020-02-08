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
});
function addCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}