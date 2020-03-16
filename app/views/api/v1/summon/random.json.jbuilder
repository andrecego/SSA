# frozen_string_literal: true

json.id @character.id
json.name @character.name
json.image url_for(@character.picture)
json.constellation do
  json.latitude @character.constellation.latitude
  json.longitude @character.constellation.longitude
end
