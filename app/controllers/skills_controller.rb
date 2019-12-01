class SkillsController < ApplicationController
  def new
    @skill = Skill.new
    @character = Character.find(params[:character_id])
  end
end