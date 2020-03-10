function search() {
  search_text = $('.search-field').val()
  rank_id = $('#rank_id').val()
  order = $('#order').val()
  Rails.ajax({
    url: "/characters/search?" + "q=" + search_text + "&rank_id=" + rank_id + "&order=" + order,
    type: "get"
    })
}
