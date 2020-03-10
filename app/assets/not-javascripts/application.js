function showOptions() {
  $(".admin").css("display", "initial");
}

document.addEventListener('turbolinks:load', function () {
  $("#collapseMenu").on("click", function () {
    $("nav .nav-menu").toggleClass("showing");
  });
});


// When the user clicks on the button, scroll to the top of the document
function topFunction() {
  document.body.scrollTop = 0;
  document.documentElement.scrollTop = 0;
}

function toogleCloth() {
  var skill_number = $('#cloth').attr('class').split(' ').slice(-1).join();
  $("." + skill_number).slideToggle("fast");
  $("#cloth-toggle").toggleClass("cloth-toggle")
  $('.stat-default').toggle();
  $('.stat-cloth').toggle();
}