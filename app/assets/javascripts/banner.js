$(".home-form-1 .fa-arrow-right").on("click", function(event) {
  event.preventDefault();
  $(".home-form-1").addClass("hidden");
  $(".home-form-2").removeClass("hidden");
})
