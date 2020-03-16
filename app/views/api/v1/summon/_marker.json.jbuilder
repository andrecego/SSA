# frozen_string_literal: true

json.id constellation.id
json.image url_for(constellation.picture)
json.tooltip "Constelação de #{constellation.name}"
json.width 256
json.height 256
json.latitude constellation.latitude
json.longitude constellation.longitude
json.content('<h1>Personagens</h1><hr><ul>' +
             constellation.characters.map do |char|
               content_tag(:li, link_to(char.name, character_path(char)))
             end.join(' ') + '</ul>')
