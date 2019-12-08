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

  def edit
    @character = Character.find(params[:character_id])
    @stat = @character.stat
  end

  def update
    @stat = Stat.find(params[:id])
    character = Character.find(params[:character_id])
      if @stat.update_attributes(stat_params)
        flash[:success] = "Stat was successfully updated"
        redirect_to character
      else
        flash[:error] = "Something went wrong"
        render :edit
      end
  end  

  def destroy
    @stat = Stat.find(params[:id])
    character = Character.find(params[:character_id])
    if @stat.destroy
      flash[:success] = 'Status apagados com êxito'
      redirect_to character
    else
      flash[:error] = 'Houve um erro ao apagar'
      redirect_to character
    end
  end

  private
  def stat_params
    params.require(:stat).permit(:health, :patk, :pdef, :matk, :mdef, :speed).merge(character_id: params[:character_id])
  end
end