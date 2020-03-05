# frozen_string_literal: true

class SkillsController < ApplicationController
  before_action :authenticate_admin

  def new
    @character = Character.find(params[:character_id])
    @skill = Skill.new
    @effects = Effect.all.order(name: :asc)
  end

  def create
    @character = Character.find(params[:character_id])
    @skill = @character.skills.new(skill_params)
    if @skill.save
      flash[:success] = 'Habilidade criada com sucesso'
      redirect_to @character
    else
      flash[:error] = 'Não foi possível criar habilidade'
      render 'new'
    end
  end

  def edit
    @character = Character.find(params[:character_id])
    @skill = @character.skills.find(params[:id])
    @effects = Effect.all.order(name: :asc)
  end

  def update
    @character = Character.find(params[:character_id])
    @skill = @character.skills.find(params[:id])
    if @skill.update(skill_params)
      flash[:success] = 'Habilidade atualizada com sucesso'
      redirect_to @character
    else
      flash[:error] = 'Algo deu errado'
      render 'edit'
    end
  end

  def destroy
    @skill = Skill.find(params[:id])
    character = Character.find(params[:character_id])
    if @skill.destroy
      flash[:success] = 'Habilidade deletada com sucesso'
    else
      flash[:error] = 'Algo deu errado'
    end
    redirect_to character
  end

  private

  def skill_params
    # deveria estar no model?
    params[:skill][:effect_ids].reject!(&:empty?)
    params[:skill][:levels].reject!(&:empty?)
    params.require(:skill).permit(:name, :cost, :description, :picture,
                                  effect_ids: [], levels: [])
  end
end
