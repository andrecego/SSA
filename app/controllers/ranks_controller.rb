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

  def edit
    @rank = Rank.find(params[:id])
  end

  def update
    @rank = Rank.find(params[:id])
      if @rank.update_attributes(rank_params)
        flash[:success] = "Rank was successfully updated"
        redirect_to ranks_path
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end

  def destroy
    @rank = Rank.find(params[:id])
    if @rank.destroy
      flash[:success] = 'Rank was successfully deleted.'
      redirect_to ranks_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to ranks_url
    end
  end
  
  
  private
  def rank_params
    params.require(:rank).permit(:name)
  end
end