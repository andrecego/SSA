class CosmosSetsController < ApplicationController
  def new
    @character = Character.find(params[:character_id])
    @cosmos_set = CosmosSet.new
    @cosmos = Cosmo.all
    @solar = @cosmos.where(cosmo_type: CosmoType.find_by(name: 'Solar'))
    @lunar = @cosmos.where(cosmo_type: CosmoType.find_by(name: 'Lunar'))
    @stellar = @cosmos.where(cosmo_type: CosmoType.find_by(name: 'Estelar'))
    @legendary = @cosmos.where(cosmo_type: CosmoType.find_by(name: 'Lendário'))
  end
  
  def create
    @cosmos_set = CosmosSet.new(cosmos_set_params)
    character = Character.find(params[:character_id])
    if @cosmos_set.save
      flash[:success] = 'Set de Cosmos criado com sucesso'
      redirect_to character
    else
      flash[:error] = 'Algo deu errado'
      redirect_to character
    end
  end

  private

  def cosmos_set_params
    params.require(:cosmos_set).permit(cosmos_ids: []).merge(character_id: params[:character_id])
  end
end