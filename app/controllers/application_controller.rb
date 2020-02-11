# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def authenticate_admin
    return if params[:controller].match? %r{^(devise/)}
    return if current_user&.admin?

    redirect_to root_path
  end
end
