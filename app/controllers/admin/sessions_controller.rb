class Admin::SessionsController < ApplicationController
  def new
    
  end

  def create
    staff = Staff.find_by(email: session_params[:email])

    if staff&.authenticate(session_params[:password])
      session[:staff_id] = staff.id
      flash[:notice] = "ログインしました"
      redirect_to admin_root_url
    else
      render :new
    end
  end

  def destroy
    reset_session
    flash[:notice] = "ログアウトしました"
    redirect_to admin_root_url  
  end

  # private
  
  def session_params
    params.require(:session).permit(:email, :password)
  end
end
