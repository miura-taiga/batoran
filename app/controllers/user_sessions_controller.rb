class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      flash[:success] = t('user_sessions.create.login_success')
      redirect_to boards_path
    else
      flash.now[:danger] = t('user_sessions.create.login_failure')
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    flash[:success] = t('user_sessions.logout_success')
    redirect_to root_path, status: :see_other
  end
end
