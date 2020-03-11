$(document).on('turbolinks:load', function () {
  function search() {
    search_text = $('.search-field').val()
    rank_id = $('#rank_id').val()
    order = $('#order').val()
    $.get("/characters/search?" + "q=" + search_text + "&rank_id=" + rank_id + "&order=" + order)
  }

  // call search() on input change
  $('#q').on('input', function () {
    var search_text = $('#q').val()
    if (search_text.length > 2 || search_text.length == 0) { search() }
  });

  // lose focus of the field tag
  $('input').keyup(function (event) {
    if (event.which === 13) {
      $(this).blur();
      search();
    }
  });

  // Order on change
  $('#order').on('change', function () { search(); })

  // Rank on change
  $('#rank_id').on('change', function () { search(); })

})