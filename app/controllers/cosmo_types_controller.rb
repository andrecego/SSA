class CosmoTypesController < ApplicationController
  def index
    @cosmo_types = CosmoType.all
  end
  
  def new
    @cosmo_type = CosmoType.new
  end
  
  def create
    @cosmo_type = CosmoType.new(cosmo_type_params)
    if @cosmo_type.save
      flash[:success] = "Tipo de Cosmo criado com sucesso"
      redirect_to cosmo_types_path
    else
      flash[:error] = "Algo deu errado"
      render 'new'
    end
  end

  def edit
    @cosmo_type = CosmoType.find(params[:id])
  end
  
  def update
    @cosmo_type = CosmoType.find(params[:id])
      if @cosmo_type.update_attributes(cosmo_type_params)
        flash[:success] = "Tipo de Cosmo atualizado com sucesso"
        redirect_to cosmo_types_path
      else
        flash[:error] = "Algo deu errado"
        render 'edit'
      end
  end  

  def destroy
    @cosmo_type = CosmoType.find(params[:id])
    if @cosmo_type.destroy
      flash[:success] = 'Tipo de Cosmo deletado com sucesso'
      redirect_to cosmo_types_url
    else
      flash[:error] = 'Algo deu errado'
      redirect_to cosmo_types_url
    end
  end
  
  private
  def cosmo_type_params
    params.require(:cosmo_type).permit(:name)
  end
end