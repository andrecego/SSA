class CharactersController < ApplicationController
  def index
    @characters = Character.all
  end

  def new
    @character = Character.new
    @base_attribute = @character.build_base_attribute
  end

  def create
    @character = Character.new(character_params)
    byebug
    if @character.save
      flash[:success] = 'Personagem salvo com êxito'
      redirect_to @character
    else
      flash[:error] = 'Algo deu errado'
      render :new
    end
  end

  def show
    @character = Character.find(params[:id])
  end

  private
  def character_params
    params.require(:character).permit(:name, :rank, base_attribute: [:health, :patk, :pdef, :matk, :mdef, :speed])
  end
end