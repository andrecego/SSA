class ApplicationController < ActionController::Base
  before_action :authenticate_admin, only: %i[new create edit update destroy]

  def authenticate_admin
    return if params[:controller].match? /^(devise\/)/
    return if current_user && current_user.admin?

    redirect_to root_path
  end
end
