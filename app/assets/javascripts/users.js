$(function() {
 	$('.datepicker').each(function(index, item) {
 		$(item).datepicker({ dateFormat: 'dd-mm-yy' });
 	}); 
});

$('.tiny.button.toggle').click(function() {
	var buttonClicked = $(this);
	var order_to_update_id = $(this).data('order-id');
	var lesson_to_update_id = $(this).data('id');
	var updated_status = '';
	var dateOfLesson = '';
	var statusLabel = $('#label-' + lesson_to_update_id);
	var dateField = $('#date-' + lesson_to_update_id);
	var dateCell = $('#tablecell-' + lesson_to_update_id);
	if (statusLabel.data('status') == 'Available') {
		updated_status = 'Used';
		dateOfLesson = dateField.val();
	}
	else {
		updated_status = 'Available';
		dateOfLesson = null;
	}

	
	$.ajax({
		url : '/users/'+lesson_to_update_id, 
		type: 'PUT',
		data: {'orderId': order_to_update_id, 'status' : updated_status, 'dateused' : dateOfLesson}, 
		success : function(res) {
			if (statusLabel.data('status') == 'Available') {
				statusLabel.removeClass('success');
				statusLabel.addClass('alert');
				statusLabel.data('status','Used');
				statusLabel.text('Used');
				dateCell.html('<span>' + dateOfLesson + '</span>');
				buttonClicked.text('Edit');
			}
			else {
				statusLabel.removeClass('alert');
				statusLabel.addClass('success');
				statusLabel.data('status','Available');
				statusLabel.text('Available');
				dateCell.html('<input type="text" class="datepicker" id="date-'+lesson_to_update_id+'" data-id="'+lesson_to_update_id+'">');
				$("#date-" + lesson_to_update_id).datepicker({ dateFormat: 'dd-mm-yy' });
				// dateField.val('');
				buttonClicked.text('Submit');
			}
		}//end success callback
	});//end ajax function

	return false;
});