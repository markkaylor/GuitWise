$(function() {
  $(".tab").on("click", function(e){
    $(".tab").removeClass("active");
    $(this).addClass("active");
    $(".user-sections").addClass("hidden")
    tabSelector = $(this).data("target");
    $(tabSelector).removeClass("hidden");
  });
});
