function search() {
  search_text = $('.search_field').val()
  rank_id = $('#rank_id').val()
  order = $('#order').val()
  Rails.ajax({
    url: "/characters/search?" + "q=" + search_text + "&rank_id=" + rank_id + "&order=" + order,
    type: "get",
    data: "",
    success: function(data) {
      document.getElementById('characters-grid').innerHTML = "";
      $.each(data, function( index, value ) { 
        $("#characters-grid").append("<div class='col-6 col-md-4 col-lg-3 mb-3'> <a href='/characters/" + value['id'] + "'> <img src='" + value['picture'] + "' title='" + value['name'] + "' class='img-fluid' </a> </div>")
     })
    },
    })
}
