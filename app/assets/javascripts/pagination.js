var loadNextPage = function(){
  if ($('#next_link')[0] == null ){ return }  // prevent 'undefined' errors
  if ($('#next_link').data("loading")){ return }  // prevent multiple loading

  var wBottom  = $(window).scrollTop() + $(window).height() + 100;
  var elBottom = $('#characters-grid').offset().top + $('#characters-grid').height();
  if (wBottom > elBottom){
    $('#next_link')[0].click();
    $('#next_link').data("loading", true);
  }
};

window.addEventListener('resize', loadNextPage);
window.addEventListener('scroll', loadNextPage);
window.addEventListener('load',   loadNextPage);