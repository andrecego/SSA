# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend
  def collection_ranks
    Rank.all.map { |rank| [rank.id, rank.name] }.prepend(['', 'Todos'])
  end

  def show_svg(path)
    File.open("app/assets/images/#{path}", 'rb') do |file|
      raw file.read
    end
  end
end
