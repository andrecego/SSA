# frozen_string_literal: true

class CharactersController < ApplicationController
  before_action :authenticate_admin, only: %i[new create edit update destroy]

  include Pagy::Backend

  def index
    @pagy, @characters = pagy_countless(Character.all.order(name: :asc),
                                        items: 12,
                                        link_extra: 'data-remote="true"')
  end

  def search
    character_search_and_order
    if params[:rank_id].present?
      @characters = @characters.where(rank_id: params[:rank_id])
    end
    @pagy, @characters = pagy_countless(
      @characters, items: 12, link_extra: 'data-remote="true"'
    )
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
      flash[:error] = 'Não foi possível cadastrar o personagem'
      render :new
    end
  end

  def show
    @character = Character.find(params[:id])
    @skills = @character.skills.order(order: :asc, kind: :asc)
    @stats = @character.stats
    @cosmos_sets = @character.cosmos_sets
  end

  def edit
    @character = Character.find(params[:id])
  end

  def update
    @character = Character.find(params[:id])
    if @character.update(character_params)
      flash[:success] = 'Personagem atualizado com êxito'
      redirect_to @character
    else
      flash[:error] = 'Algo deu errado'
      render 'edit'
    end
  end

  def destroy
    @character = Character.find(params[:id])
    if @character.destroy
      flash[:success] = 'Personagem apagado com êxito'
    else
      flash[:error] = 'Houve um erro ao apagar'
    end
    redirect_to characters_path
  end

  private

  def character_params
    params.require(:character).permit(:name, :rank_id, :constellation_id,
                                      :picture)
  end

  def character_search_and_order
    @characters = if params[:q]
                    Character.where('name ILIKE ?', "%#{params[:q]}%")
                  else
                    Character.all
                  end
    @characters = if params[:order].present?
                    @characters.joins(:stat).order("#{order_sanitizer} DESC")
                  else
                    @characters.order(name: :asc)
                  end
  end

  def order_sanitizer
    if %w[health patk pdef matk mdef speed].include?(params[:order])
      return params[:order]
    end

    'health'
  end
end
