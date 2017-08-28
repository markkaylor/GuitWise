$(function(){
  var tagInput = "";
  $("#tags input").on({
    focusout : function() {
      var txt = this.value.replace(/[^a-z0-9\+\-\.\#]/ig,''); // allowed characters
      if(txt) $("<span/>", {text:txt.toLowerCase(), insertBefore:this});
      if(txt) {
        tagInput += ' ' + txt
        $("#post_tag").val(tagInput);
      };

      this.value = "";
    },
    keyup : function(ev) {
      // if: comma|enter (delimit more keyCodes with | pipe)
      if(/(188|13|32)/.test(ev.which)) $(this).focusout();
    }
  });
  $('#tags').on('click', 'span', function() {
    var tagInput = $("#post_tag").val();
    tagInput = tagInput.replace($(this).text(), '');
    $("#post_tag").val(tagInput);
    $(this).remove();

  });
  // $('.new-post.form-actions input').blur( function() {
  //   // $(window).bind('beforeunload', function(){
  //   var spans = document.getElementsByTagName("span");
  //   var tagInput = "";
  //   for(var i = 0; i < spans.length; i++){
  //     tagInput += ' ' + spans[i];
  //   };
  //   $('.tags-hidden').value = tagInput;
  // });
});
