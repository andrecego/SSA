# frozen_string_literal: true

class CosmoBasicsController < ApplicationController
  before_action :authenticate_admin

  def index
    @cosmo_basics = CosmoBasic.all
  end

  def new
    @cosmo_basic = CosmoBasic.new
  end

  def create
    @cosmo_basic = CosmoBasic.new(cosmo_basic_params)
    if @cosmo_basic.save
      flash[:success] = 'Base de Cosmo criado com sucesso'
      redirect_to cosmo_basics_path
    else
      flash[:error] = 'Algo deu errado'
      render 'new'
    end
  end

  def edit
    @cosmo_basic = CosmoBasic.find(params[:id])
  end

  def update
    @cosmo_basic = CosmoBasic.find(params[:id])
    if @cosmo_basic.update(cosmo_basic_params)
      flash[:success] = 'Base de Cosmo atualizada com sucesso'
      redirect_to cosmo_basics_path
    else
      flash[:error] = 'Algo deu errado'
      render 'edit'
    end
  end

  def destroy
    @cosmo_basic = CosmoBasic.find(params[:id])
    if @cosmo_basic.destroy
      flash[:success] = 'Base de Cosmo deletada com sucesso'
    else
      flash[:error] = 'Algo deu errado'
    end
    redirect_to cosmo_basics_url
  end

  private

  def cosmo_basic_params
    params.require(:cosmo_basic).permit(:name)
  end
end
