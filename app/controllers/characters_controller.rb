class CharactersController < ApplicationController
  def index
    @characters = Character.all
  end

  def new
    @character = Character.new
    @stat = @character.build_stat
    @skills = @character.skills.build
  end

  def create
    @character = Character.new(character_params)
    @character.stat = Stat.new(character_params[:stat_attributes])
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
    params.require(:character).permit(:name, 
                                      :rank, 
                                      stat_attributes: [:health, :patk, :pdef, :matk, :mdef, :speed],
                                      skills_attributes: [:name, :cost, :description, effect_ids: []])
  end
end
