class ApplicationController < ActionController::Base
  before_action :require_login

  private

  def not_authenticated
    redirect_to login_path
  end

  def set_current_user
    @current_user = current_user.decorate if current_user
  end
end