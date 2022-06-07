class Admin::StaffsController < ApplicationController
  before_action :admin_required
  
  def new
    @staff = Staff.new
  end
  
  def create
    @staff = Staff.new(staff_params)
  
    if @staff.save
      flash[:notice] = "スタッフ情報を新規登録しました。"
      redirect_to admin_root_url
    else
      render :new
    end
  end

  def show
    @staff = Staff.find(params[:id])
  end

  def edit
    @staff = Staff.find(params[:id])
  end
  

  def update
    @staff = Staff.find(params[:id])
  
    if @staff.update(staff_params)
      flash[:notice] = "スタッフ情報を更新しました。"
      redirect_to admin_root_url
    else
      render :edit
    end
  end

  def destroy
    staff = Staff.find(params[:id])
    staff.destroy
    flash[:notice] = "スタッフ情報を削除しました"
    redirect_to admin_root_url
  end

  private

  def staff_params
    params.require(:staff).permit(:name, :email, :password, :password_confirmation)
  end
end
