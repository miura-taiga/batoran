class ApplicationController < ActionController::Base
  before_action :require_login

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def top
    @posts = Post.all
  end

  private

  def require_login
    if current_user.nil?
      flash[:danger] = t('flash.not_authenticated')
      redirect_to login_path
    end
  end

  def set_current_user
    @current_user = current_user.decorate if current_user
  end
end