class CharactersController < ApplicationController
  include Pagy::Backend

  def index
    @pagy, @characters = pagy_countless(Character.all.order(name: :asc), items: 12, link_extra: 'data-remote="true"')
  end

  def search
    @characters = if params[:q]
                    Character.where("name ILIKE ?", "%#{params[:q]}%")
                  else
                    Character.all
                  end
    @characters = if params[:order].present?
                    @characters.joins(:stat).order("#{order_sanitizer} DESC")
                  else
                    @characters.order(name: :asc)
                  end
    @characters = @characters.where(rank_id: params[:rank_id]) if params[:rank_id].present?
    @pagy, @characters = pagy_countless(@characters, items: 12, link_extra: 'data-remote="true"')
    # render json: @characters, each_serializer: CharacterSerializer
    
    respond_to do |format|
      format.js { render 'search' }
    end
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

  def order_sanitizer
    return params[:order] if ['health', 'patk', 'pdef', 'matk', 'mdef', 'speed'].include?(params[:order])

    'health'
  end
end
