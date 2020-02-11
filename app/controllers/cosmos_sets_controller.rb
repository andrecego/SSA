# frozen_string_literal: true

class CosmosSetsController < ApplicationController
  before_action :find_character
  before_action :prepare, only: %i[new edit]
  before_action :authenticate_admin

  def new
    @cosmos_set = CosmosSet.new
  end

  def create
    @cosmos_set = CosmosSet.new(cosmos_set_params)
    character = Character.find(params[:character_id])
    if @cosmos_set.save
      flash[:success] = 'Set de Cosmos criado com sucesso'
    else
      flash[:error] = 'Algo deu errado'
    end
    redirect_to character
  end

  def edit
    @cosmos_set = CosmosSet.find(params[:id])
  end

  def update
    @cosmos_set = CosmosSet.find(params[:id])
    if @cosmos_set.update(cosmos_set_params)
      flash[:success] = 'Set de Cosmos atualizado com sucesso'
      redirect_to @character
    else
      flash[:error] = 'Algo deu errado'
      render 'edit'
    end
  end

  def destroy
    @cosmos_set = CosmosSet.find(params[:id])
    if @cosmos_set.destroy
      flash[:success] = 'Set de Cosmos deletado com sucesso.'
    else
      flash[:error] = 'Algo deu errado'
    end
    redirect_to @character
  end

  private

  def cosmos_set_params
    params.require(:cosmos_set).permit(cosmos_ids: [])
          .merge(character_id: params[:character_id])
  end

  def prepare
    @character = Character.find(params[:character_id])
    @cosmos = Cosmo.all.order(name: :asc)
    @solar = @cosmos.where(cosmo_type: CosmoType.find_by(name: 'Solar'))
    @lunar = @cosmos.where(cosmo_type: CosmoType.find_by(name: 'Lunar'))
    @stellar = @cosmos.where(cosmo_type: CosmoType.find_by(name: 'Estelar'))
    @legendary = @cosmos.where(cosmo_type: CosmoType.find_by(name: 'Lendário'))
  end

  def find_character
    @character = Character.find(params[:character_id])
  end
end
