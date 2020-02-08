# frozen_string_literal: true

class ConstellationsController < ApplicationController
  before_action :authenticate_admin

  def index
    @constellations = Constellation.all
  end

  def new
    @constellation = Constellation.new
  end

  def create
    @constellation = Constellation.new(constellation_params)
    if @constellation.save
      flash[:success] = 'Constelação criada com êxito'
      redirect_to @constellation
    else
      flash[:error] = 'Houve um erro na criação'
      render :new
    end
  end

  def show
    @constellation = Constellation.find(params[:id])
  end

  def edit
    @constellation = Constellation.find(params[:id])
  end

  def update
    @constellation = Constellation.find(params[:id])
    if @constellation.update(constellation_params)
      flash[:success] = 'Constelação atualizada com êxito'
      redirect_to @constellation
    else
      flash[:error] = 'Houve um erro na atualização'
      render :edit
    end
  end

  def destroy
    @constellation = Constellation.find(params[:id])
    if @constellation.destroy
      flash[:success] = 'Constelação apagada com êxito'
    else
      flash[:error] = 'Houve um erro ao apagar'
    end
    redirect_to constellations_path
  end

  private

  def constellation_params
    params.require(:constellation).permit(:name)
  end
end
