class RanksController < ApplicationController
  def index
    @ranks = Rank.all
  end

  def new
    @rank = Rank.new
  end

  def create
    @rank = Rank.new(rank_params)
    if @rank.save
      flash[:success] = 'Rank criado com sucesso'
      redirect_to ranks_path
    else
      flash[:error] = 'Aglo deu errado'
      render :new
    end
  end

  private
  def rank_params
    params.require(:rank).permit(:name)
  end
end