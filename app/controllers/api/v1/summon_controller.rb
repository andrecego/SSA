# frozen_string_literal: true

class Api::V1::SummonController < Api::V1::ApiController
  def markers
    @constellations = Constellation.joins(:picture_attachment)
  end

  def random
    chances = { ss: 2, s: 3, a: 27, b: 268 }
    rank = random_weighted(chances).to_s.upcase
    constellations = Constellation.joins(:picture_attachment)
    @characters = Character.where(constellation: constellations)
    @character = @characters.joins(:rank).where(ranks: { name: rank }).sample
  end

  private

  def random_weighted(weighted)
    max = sum_of_weights(weighted)
    target = rand(1..max)
    weighted.each do |item, weight|
      return item if target <= weight

      target -= weight
    end
  end

  def sum_of_weights(weighted)
    weighted.inject(0) { |sum, (_item, weight)| sum + weight }
  end
end
