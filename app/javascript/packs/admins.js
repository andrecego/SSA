var adminzz = function showOptions() {
  $(".admin").css("display", "initial");
}
$(document).on('turbolinks:load', function () {
  // Mobile hamburguer menu
  $("#collapseMenu").on("click", function () {
    $("nav .nav-menu").toggleClass("showing");
  });

  // Toggle Cloth Repair
  $('#cloth-button').on('click', function () {
    var skill_number = $('#cloth').attr('class').split(' ').slice(-1).join();
    $("." + skill_number).toggle("fast");
    $("#cloth-toggle").toggleClass("cloth-toggle");
    $('.stat-default').toggle();
    $('.stat-cloth').toggle();
  });

  // When the user clicks on the button, scroll to the top of the document
  $("#to-top").on("click", function () {
    document.body.scrollTop = 0;
    document.documentElement.scrollTop = 0;
  });
})
