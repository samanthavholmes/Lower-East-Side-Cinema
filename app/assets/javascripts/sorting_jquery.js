var ready;
ready = function() {
  $("#star_sort").on("click",function(event){
    $target = $(event.target)
    $target.parents().find(".clicked").removeClass("clicked");
    $target.parent().addClass("clicked");
    $(".active").hide();
    $("#sort_by_stars").addClass("active");
    $("#sort_by_stars").show();
  });

  $("#recent_sort").on("click",function(event){
    $target = $(event.target)
    $target.parents().find(".clicked").removeClass("clicked");
    $target.parent().addClass("clicked");
    $(".active").hide();
    $("#sort_by_recent").addClass("active");
    $("#sort_by_recent").show();
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);
