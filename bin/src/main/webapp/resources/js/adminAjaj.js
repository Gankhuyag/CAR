$(document).ready(function() {

	var contextRoot = "/" + window.location.pathname.split('/')[1];

	approveAuction = function(auctionId) {
		$.ajax({
			url : contextRoot + "/admin/auction/approve/" + auctionId,
			type : 'PUT',
			dataType : "json",
			success : function(response) {
				alert("Auction Approved");
				$('#row-'+auctionId).remove();

			},
			error : function() {
				alert('Error while request..');
			}
		});
	}
	
	rejectAuction = function(auctionId) {
		$.ajax({
			url : contextRoot + "/admin/auction/reject/" + auctionId,
			type : 'PUT',
			dataType : "json",
			success : function(response) {
				alert("Auction Reject");
				$('#row-'+auctionId).remove();

			},
			error : function() {
				alert('Error while request..');
			}
		});
	}

});
