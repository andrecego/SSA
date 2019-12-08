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
      flash[:error] = 'Algo deu errado'
      render :new
    end
  end

  def edit
    @rank = Rank.find(params[:id])
  end

  def update
    @rank = Rank.find(params[:id])
      if @rank.update_attributes(rank_params)
        flash[:success] = "Rank atualizado com sucesso"
        redirect_to ranks_path
      else
        flash[:error] = "Algo deu errado"
        render 'edit'
      end
  end

  def destroy
    @rank = Rank.find(params[:id])
    if @rank.destroy
      flash[:success] = 'Rank deletado com sucesso'
      redirect_to ranks_url
    else
      flash[:error] = 'Algo deu errado'
      redirect_to ranks_url
    end
  end
  
  
  private
  def rank_params
    params.require(:rank).permit(:name)
  end
end