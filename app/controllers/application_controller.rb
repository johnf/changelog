class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :admin_signed_in?

  private
  def admin_signed_in?
    user_signed_in? and current_user.admin?
  end
end
