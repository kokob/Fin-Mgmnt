/**
 * 
 */
$(function(){
	$('body').on('keydown', '.numberOnly', function(e){
		if((e.keyCode < 48 || e.keyCode > 57) && e.keyCode != 8){
			e.preventDefault();
		}
	});
});