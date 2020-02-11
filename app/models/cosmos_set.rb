# frozen_string_literal: true

class CosmosSet < ApplicationRecord
  belongs_to :character

  def cosmos
    cosmos_ids.map { |cosmo_id| Cosmo.find(cosmo_id) }
  end
end
