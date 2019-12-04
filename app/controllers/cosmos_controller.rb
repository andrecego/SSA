class CosmosController < ApplicationController

  def all
    @cosmos = Cosmo.all
  end
  
  def index
    @cosmos = Cosmo.all
  end
  
  def new
    @cosmo = Cosmo.new
  end

  def create
    @cosmo = Cosmo.new(cosmo_params)
    byebug
    if @cosmo.save
      flash[:success] = "Cosmo successfully created"
      redirect_to cosmos_path
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  
  private
  def cosmo_params
    params[:cosmo][:cosmo_basic_ids].reject!(&:empty?)
    params.require(:cosmo).permit(:name, :cosmo_type_id, cosmo_basic_ids: [])
  end
end