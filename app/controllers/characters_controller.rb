class CharactersController < ApplicationController
  def index
    @characters = Character.all
  end

  def new
    @character = Character.new
    # @stat = @character.build_stat
    # @skills = @character.skills.build
  end

  def create
    @character = Character.new(character_params)
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
    params.require(:character).permit(:name, :rank_id, :constellation_id)
  end
end
