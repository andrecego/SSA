class ConstellationsController < ApplicationController 
  def index
    @constellations = Constellation.all
  end
end