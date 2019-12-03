class EffectsController < ApplicationController
  def index
    @effects = Effect.all
  end

  def new
    @effect = Effect.new
  end

  def create
    @effect = Effect.new(effect_params)
    if @effect.save
      flash[:success] = "Effect successfully created"
      redirect_to effects_path
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def edit
    @effect = Effect.find(params[:id])
  end
  
  def update
    @effect = Effect.find(params[:id])
      if @effect.update_attributes(effect_params)
        flash[:success] = "Effect was successfully updated"
        redirect_to effects_path
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end
  
  def destroy
    @effect = Effect.find(params[:id])
    if @effect.destroy
      flash[:success] = 'Effect was successfully deleted.'
      redirect_to effects_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to effects_url
    end
  end
  

  private
  def effect_params
    params.require(:effect).permit(:name)
  end
end