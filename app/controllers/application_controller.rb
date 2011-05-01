class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :admin_signed_in?

  private
  def admin_signed_in?
    user_signed_in? and current_user.admin?
  end

  def delayed_job_admin_authentication
    authenticate_user!
    unless current_user.admin?
      render :text => 'not authorized'
      return false
    end
  end
end
