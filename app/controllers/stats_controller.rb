class StatsController < ApplicationController
  def new
    @stat = Stat.new
    @character = Character.find(params[:character_id])
  end

  def create
    @stat = Stat.new(stat_params)
    character = Character.find(params[:character_id])
    if @stat.save
      flash[:success] = 'Status salvos com êxito'
      redirect_to character
    else
      flash[:error] = 'Algo deu errado'
      render :new
    end
  end

  private
  def stat_params
    params.require(:stat).permit(:health, :patk, :pdef, :matk, :mdef, :speed).merge(character_id: params[:character_id])
  end
end