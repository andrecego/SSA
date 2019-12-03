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
      flash[:success] = "CosmoType successfully created"
      redirect_to cosmo_types_path
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def edit
    @cosmo_type = CosmoType.find(params[:id])
  end
  
  def update
    @cosmo_type = CosmoType.find(params[:id])
      if @cosmo_type.update_attributes(cosmo_type_params)
        flash[:success] = "CosmoType was successfully updated"
        redirect_to cosmo_types_path
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end  

  def destroy
    @cosmo_type = CosmoType.find(params[:id])
    if @cosmo_type.destroy
      flash[:success] = 'CosmoType was successfully deleted.'
      redirect_to cosmo_types_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to cosmo_types_url
    end
  end
  
  private
  def cosmo_type_params
    params.require(:cosmo_type).permit(:name)
  end
end