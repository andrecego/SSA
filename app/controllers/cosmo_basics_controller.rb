class CosmoBasicsController < ApplicationController

  def index
    @cosmo_basics = CosmoBasic.all
  end
  
  def new
    @cosmo_basic = CosmoBasic.new
  end

  def create
    @cosmo_basic = CosmoBasic.new(cosmo_basic_params)
    if @cosmo_basic.save
      flash[:success] = "CosmoBasic successfully created"
      redirect_to cosmo_basics_path
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def edit
    @cosmo_basic = CosmoBasic.find(params[:id])
  end
  
  def update
    @cosmo_basic = CosmoBasic.find(params[:id])
      if @cosmo_basic.update_attributes(cosmo_basic_params)
        flash[:success] = "CosmoBasic was successfully updated"
        redirect_to cosmo_basics_path
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end

  def destroy
    @cosmo_basic = CosmoBasic.find(params[:id])
    if @cosmo_basic.destroy
      flash[:success] = 'CosmoBasic was successfully deleted.'
      redirect_to cosmo_basics_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to cosmo_basics_url
    end
  end
  
  private
  def cosmo_basic_params
    params.require(:cosmo_basic).permit(:name)
  end
end