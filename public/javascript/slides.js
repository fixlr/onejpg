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
  viewSlide(17);
  $("#previous").click(function() {
    previousSlide()
    return false;
  });
  $("#next").click(function() {
    nextSlide()
    return false;
  });
  
  $(document).keydown(function(e){
    if (e.keyCode == 37 || e.keyCode == 38) { 
      previousSlide();
      return false;
    }
    else if (e.keyCode == 39 || e.keyCode == 40) {
      nextSlide();
      return false;
    }
  });
});

