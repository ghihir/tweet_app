class SessionsController < ApplicationController
  before_action :prohibition_double_login, only: [:new]

  def new
  end

  def create
    user = User.find_by(email: session_params[:email])

    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      flash[:notice] = "ログインしました"
      redirect_to root_url
    else
      render :new
    end
  end

  def destroy
    reset_session
    flash[:notice] = "ログアウトしました"
    redirect_to root_url
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end

  def prohibition_double_login
    if session[:user_id]
      flash[notice] = "すでにログイン中です"
      redirect_to root_url
    end
  end
end
