# frozen_string_literal: true

class Api::V1::SummonController < Api::V1::ApiController
  def markers
    @constellations = Constellation.joins(:picture_attachment)
    # @characters = Character.where(constellation: @constellations)
    # @rank_ss = @characters.where(rank: 'SS')
    # @rank_s =  @characters.where(rank: 'S')
    # @rank_a =  @characters.where(rank: 'A')
    # @rank_b =  @characters.where(rank: 'B')
  end
end
