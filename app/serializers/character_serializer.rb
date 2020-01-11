class CharacterSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :name, :picture

  def picture
    rails_blob_path(object.picture, only_path: true)
  end
end