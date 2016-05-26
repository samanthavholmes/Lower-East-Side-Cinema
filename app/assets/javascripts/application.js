$(document).ready(function() {
	$('.form-link').on('click', function(e) {
    e.preventDefault();
		var appendId = e.target.parentElement.id;
	$.ajax({ //this targets the link, shows form
	    type: "GET",
	    url: e.target.href
	}).done(function(response) {
	    $("#"+appendId).append(response);
	    $('.form-link').hide();
	  });
	});

	$('.rating-body').on('submit', ".new_rating", function(e) {
    e.preventDefault();
    var appendId = $(e.target).parent().find('ul');
	$.ajax({ //this targets the link, shows form
	    type: e.target.method,
	    url: e.target.action,
	    data: $(e.target).serialize()
	}).done(function(response) {
	    $(appendId).append(response);
	    $('#new_rating').remove();
	  });
	});
});