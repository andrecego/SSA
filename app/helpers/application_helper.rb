module ApplicationHelper
  def collection_ranks
    Rank.all.map{|rank| [rank.id, rank.name]}.prepend(['', 'Todos'])
  end
end
