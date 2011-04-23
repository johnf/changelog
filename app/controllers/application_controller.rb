class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  def admin_signed_in?
    user_signed_in? and current_user.admin?
  end
end
