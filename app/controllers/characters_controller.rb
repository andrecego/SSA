class CharactersController < ApplicationController
  def index
    @Characters = Character.all
  end

  def new
    @Character = Character.new
  end
end