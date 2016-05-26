var ready;
ready = function() {

  $('.form-link').on('click', function(event) {
    event.preventDefault();
    $.ajax({ //this targets the link, shows form
      type: "GET",
      url: event.target.href
    }).done(function(response) {
      $(".rating-body").append(response);
      $('.form-link').hide();
    });
  });

  $('.rating-body').on('submit', ".new_rating", function(event) {
    event.preventDefault();
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

};

$(document).ready(ready);
$(document).on('page:load', ready);









