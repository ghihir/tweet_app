class UsersController < ApplicationController
  before_action :correct_user_required, only: [:edit, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "ユーザー情報を登録しました"
      session[:user_id] = @user.id
      redirect_to root_url
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:notice] = "ユーザー情報を更新しました"
      redirect_to user_url(@user)
    else
      render :edit
    end
  end

  def destroy
    reset_session
    user = User.find(params[:id])
    user.destroy
    posts = Post.where(user_id: params[:id])
    posts.destroy_all
    flash[:notice] = "退会処理が完了しました"
    redirect_to posts_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile)
  end

  def correct_user_required
    unless params[:id].to_i == session[:user_id]
      flash[notice] = "ログインしてください"
      redirect_to root_url
    end
  end
  
end
