var nextInput = function() {
  $(".home-form-1").removeClass("show");
    setTimeout(function() {
    $(".home-form-1").addClass("hidden");
    $(".home-form-2").removeClass("hidden");
    setTimeout(function() {
      $(".home-form-2").addClass("show");
      $(".home-form-2 input").focus();
    }, 150);
  }, 150);
};

var checkErrorOne = function() {
  if ($(".home-form-1 input").val()) {
    nextInput();
  } else {
    $(".home-form-1 input").addClass("red-border");
    $(".home-form-1 .fa-arrow-right").css("color", "#EE5F5B");
    return false;
  };
};

var checkErrorTwo = function() {
  if ($(".home-form-2 input").val()) {
  } else {
    $(".home-form-2 input").addClass("red-border");
    $(".home-form-2 .fa-arrow-right").css("color", "#EE5F5B");
    return false;
  };
};

$(".home-form-1 .fa-arrow-right").on("click", checkErrorOne);

$(".home-form-1 input").on("keypress", function(ev) {
  if (/13/.test(ev.which)) {
    checkErrorOne();
    return false;
  };
});

$(".home-form-2 button").on("click", checkErrorTwo);

$(".home-form-2 input").on("keypress", function(ev) {
  if (/13/.test(ev.which)) {
    checkErrorTwo();
  };
});
