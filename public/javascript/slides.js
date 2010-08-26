var shown = 0;
var t = null;
var currentPosition = function() {
  return parseInt($('#pos').text());
}
var previousSlide = function() {
  viewSlide(currentPosition() - 1);
}
var nextSlide = function() {
  viewSlide(currentPosition() + 1);
}
var viewSlide = function(i) {
  $('#slides').html('<img src="'+jpg_url + '/' + i + '.jpg" />');
  $('#pos').html(i);
}
$(document).ready(function() {
  viewSlide(currentPosition());
  $(document).keydown(function(e){
    if (currentPosition() > 1 && e.keyCode == 37) { 
      previousSlide();
      return false;
    }
    else if (e.keyCode == 39) {
      nextSlide();
      return false;
    }
  });
  $('body').mousemove(function() {
    if (!shown) {
      shown = 1;
      $('#controls').slideDown(300);
    } else {
      window.clearTimeout(t);
    }
    t = window.setTimeout(function() {
      $('#controls').slideUp(300);
      shown = 0;
    }, 750);
  });
});

