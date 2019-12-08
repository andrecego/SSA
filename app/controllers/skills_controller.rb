class SkillsController < ApplicationController
  def new
    @character = Character.find(params[:character_id])
    @skill = Skill.new
  end
  
  def create
    @character = Character.find(params[:character_id])
    @skill = @character.skills.new(skill_params)
    if @skill.save
      flash[:success] = "Skill successfully created"
      redirect_to @character
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  
  def edit
    @character = Character.find(params[:character_id])
    @skill = @character.skills.find(params[:id])
  end
  
  def update
    @character = Character.find(params[:character_id])
    @skill = @character.skills.find(params[:id])
      if @skill.update_attributes(skill_params)
        flash[:success] = "Skill was successfully updated"
        redirect_to @character
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end

  def destroy
    @skill = Skill.find(params[:id])
    character = Character.find(params[:character_id])
    if @skill.destroy
      flash[:success] = 'Skill apagada com êxito'
      redirect_to character
    else
      flash[:error] = 'Houve um erro ao apagar'
      redirect_to character
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