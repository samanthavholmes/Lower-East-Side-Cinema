$(document).ready(function() {
	$('.form-link').on('click', function(e) {
    e.preventDefault();
		
	$.ajax({ //this targets the link, shows form
	    type: "GET",
	    url: e.target.href
	}).done(function(response) {
	    $(".rating-body").append(response);
	    $('.form-link').hide();
	  });
	});

	$('.rating-body').on('submit', ".new_rating", function(e) {
    e.preventDefault();
		// debugger; 
	$.ajax({ //this targets the link, shows form
	    type: e.target.method,
	    url: e.target.action,
	    data: $(e.target).serialize()
	}).done(function(response) {
	    $(".rating").append(response);
	    $('#new_rating').remove();
	    $('.form-link').show();
	  });
	});
});