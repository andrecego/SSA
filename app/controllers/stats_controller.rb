# frozen_string_literal: true

class StatsController < ApplicationController
  before_action :authenticate_admin

  def new
    @stat = Stat.new
    @character = Character.find(params[:character_id])
  end

  def create
    @stat = Stat.new(stat_params)
    character = Character.find(params[:character_id])
    if @stat.save
      flash[:success] = 'Status criados com sucesso'
      redirect_to character
    else
      @character = Character.find(params[:character_id])
      flash[:error] = 'Algo deu errado'
      render :new
    end
  end

  def edit
    @stat = Stat.find(params[:id])
    @character = @stat.character
  end

  def update
    @stat = Stat.find(params[:id])
    @character = @stat.character
    if @stat.update(stat_params)
      flash[:success] = 'Status atualizados com sucesso'
      redirect_to @character
    else
      flash[:error] = 'Algo deu errado'
      render :edit
    end
  end

  def destroy
    @stat = Stat.find(params[:id])
    character = Character.find(params[:character_id])
    if @stat.destroy
      flash[:success] = 'Status deletados com sucesso'
    else
      flash[:error] = 'Algo deu errado'
    end
    redirect_to character
  end

  private

  def stat_params
    params.require(:stat)
          .permit(:health, :patk, :pdef, :matk, :mdef, :speed, :kind)
          .merge(character_id: params[:character_id])
  end
end
