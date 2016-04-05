/**
 * 
 */
$(document).ready(function() {
	
	$(".contractEditLink").click(function(e) {
		var contractId = e.target.find("#hiddenContractId").val();
		var url = "getContract/"+contractId;
		alert(url);
//		$.getJSON(url, function(response) {
//			
//			
//			
//			
//			
//			
//		});
	});

});