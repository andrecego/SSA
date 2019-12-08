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
      flash[:success] = "Efeito criado com sucesso"
      redirect_to effects_path
    else
      flash[:error] = "Algo deu errado"
      render 'new'
    end
  end

  def edit
    @effect = Effect.find(params[:id])
  end
  
  def update
    @effect = Effect.find(params[:id])
      if @effect.update_attributes(effect_params)
        flash[:success] = "Efeito atualizado com sucesso"
        redirect_to effects_path
      else
        flash[:error] = "Algo deu errado"
        render 'edit'
      end
  end
  
  def destroy
    @effect = Effect.find(params[:id])
    if @effect.destroy
      flash[:success] = 'Efeito deletado com sucesso.'
      redirect_to effects_url
    else
      flash[:error] = 'Algo deu errado'
      redirect_to effects_url
    end
  end
  

  private
  def effect_params
    params.require(:effect).permit(:name)
  end
end