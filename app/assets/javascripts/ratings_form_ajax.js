$(document).ready(function() {
  $('.form-link').on('click', function(event) {
    event.preventDefault();
    var appendId = event.target.parentElement.id;
    $.ajax({ //this targets the link, shows form
      type: "GET",
      url: event.target.href
    }).done(function(response) {
       $("#"+appendId).append(response);
      $('.form-link').hide();
    });
  });

  $('.rating-body').on('submit', ".new_rating", function(e) {
    e.preventDefault();
    $.ajax({ //this targets the link, shows form
      type: e.target.method,
      url: e.target.action,
      data: $(e.target).serialize()
    }).done(function(response) {
      $('#public-reviews').prepend(response);
      $('#new_rating').remove();
    });
  });

});


