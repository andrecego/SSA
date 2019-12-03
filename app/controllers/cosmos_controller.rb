class CosmosController < ApplicationController

  def all
    @cosmos = Cosmo.all
  end
  
  def index
    @cosmos = Cosmo.all
  end
  
end