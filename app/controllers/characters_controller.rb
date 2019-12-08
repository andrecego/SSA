class CharactersController < ApplicationController
  def index
    @characters = Character.all
  end

  def new
    @character = Character.new
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

  def edit
    @character = Character.find(params[:id])
  end
  
  def update
    @character = Character.find(params[:id])
      if @character.update_attributes(character_params)
        flash[:success] = "Personagem atualizado com êxito"
        redirect_to @character
      else
        flash[:error] = "Algo deu errado"
        render 'edit'
      end
  end

  def destroy
    @character = Character.find(params[:id])
    if @character.destroy
      flash[:success] = 'Personagem apagado com êxito'
      redirect_to characters_path
    else
      flash[:error] = 'Houve um erro ao apagar'
      redirect_to characters_path
    end
  end
  

  private
  def character_params
    params.require(:character).permit(:name, :rank_id, :constellation_id, :picture)
  end
end
