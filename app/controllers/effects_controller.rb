# frozen_string_literal: true

class EffectsController < ApplicationController
  before_action :authenticate_admin

  def index
    @effects = Effect.all
  end

  def new
    @effect = Effect.new
  end

  def create
    @effect = Effect.new(effect_params)
    if @effect.save
      flash[:success] = 'Efeito criado com sucesso'
      redirect_to effects_path
    else
      flash[:error] = 'Algo deu errado'
      render 'new'
    end
  end

  def edit
    @effect = Effect.find(params[:id])
  end

  def update
    @effect = Effect.find(params[:id])
    if @effect.update(effect_params)
      flash[:success] = 'Efeito atualizado com sucesso'
      redirect_to effects_path
    else
      flash[:error] = 'Algo deu errado'
      render 'edit'
    end
  end

  def destroy
    @effect = Effect.find(params[:id])
    if @effect.destroy
      flash[:success] = 'Efeito deletado com sucesso.'
    else
      flash[:error] = 'Algo deu errado'
    end
    redirect_to effects_url
  end

  private

  def effect_params
    params.require(:effect).permit(:name)
  end
end
