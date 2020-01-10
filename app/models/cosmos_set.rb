class CosmosSet < ApplicationRecord
  belongs_to :character
  has_many :cosmos

  def cosmos
    cosmos_ids.map { |cosmo_id| Cosmo.find(cosmo_id) }
  end
end
