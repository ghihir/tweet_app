class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :current_staff
  layout :set_layout

  private

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def set_layout
    if params[:controller].match(%r{\A(admin)/})
      "admin"
    end
  end

  def current_staff
    if session[:staff_id]
      @current_staff ||= Staff.find_by(id: session[:staff_id])
    end
  end

  def admin_required
    if session[:staff_id]
      current_staff ||= Staff.find_by(id: session[:staff_id])
    end
    unless current_staff
      redirect_to root_url
    end
  end
end
