class CosmosController < ApplicationController

  def index
    @cosmos = Cosmo.all
  end
  
  def new
    @cosmo = Cosmo.new
  end

  def create
    @cosmo = Cosmo.new(cosmo_params)
    if @cosmo.save
      flash[:success] = "Cosmo criado com sucesso"
      redirect_to cosmos_path
    else
      flash[:error] = "Algo deu errado"
      render 'new'
    end
  end

  def edit
    @cosmo = Cosmo.find(params[:id])    
  end

  def update
    @cosmo = Cosmo.find(params[:id])
    if @cosmo.update_attributes(cosmo_params)
      flash[:success] = "Cosmo atualizado com sucesso"
      redirect_to cosmos_path
    else
      flash[:error] = "Algo deu errado"
      render 'edit'
    end
  end
  
  def destroy
    @cosmo = Cosmo.find(params[:id])
    if @cosmo.destroy
      flash[:success] = 'Cosmo deletado com sucesso'
      redirect_to cosmos_path
    else
      flash[:error] = 'Algo deu errado'
      redirect_to cosmos_path
    end
  end
  
  private
  def cosmo_params
    params[:cosmo][:cosmo_basic_ids].reject!(&:empty?)
    params.require(:cosmo).permit(:name, :set, :cosmo_type_id, :picture, cosmo_basic_ids: [])
  end
end