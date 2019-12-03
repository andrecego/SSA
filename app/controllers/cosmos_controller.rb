class CosmosController < ApplicationController
  def index
    @cosmos = Cosmo.all
  end
  
end