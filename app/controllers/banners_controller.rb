class BannersController < ApplicationController
  def index; end

  def new
    @banner = Banner.new
    @characters = Character.where(rank_id: Rank.where(name: ['S', 'SS']).ids)
                           .order(name: :asc)
  end
  
  def create
    @banner = Banner.new(banner_params)
    if @banner.save
      flash[:success] = 'Banner salvo com sucesso.'
      redirect_to @banner
    else
      flash[:alert] = 'Houve um erro.'
      render :new
    end
  end

  def show
    @banner = Banner.find(params[:id])
  end

  private

  def banner_params
    params.require(:banner).permit(:character_id, :initial_date,
                                   :end_date, :picture)
  end
end