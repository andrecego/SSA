# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend
  def collection_ranks
    Rank.all.map { |rank| [rank.id, rank.name] }.prepend(['', 'Todos'])
  end
end
