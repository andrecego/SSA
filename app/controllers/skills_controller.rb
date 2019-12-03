class SkillsController < ApplicationController
  def new
    @skill = Skill.new
    @character = Character.find(params[:character_id])
  end
  
  def create
    @character = Character.find(params[:character_id])
    if @character.skills.new(skill_params).save
      flash[:success] = "Skill successfully created"
      redirect_to @character
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  

  private
  def skill_params
    #deveria estar no model?
    params[:skill][:effect_ids].reject!(&:empty?)
    params[:skill][:levels].reject!(&:empty?)
    params.require(:skill).permit(:name, :cost, :description, effect_ids:[], levels: [])
  end
end