class Admin::UsersController < ApplicationController
  before_action :admin_required

  def index
    @users = User.all
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    posts = Post.where(user_id: params[:id])
    posts.destroy_all
    redirect_to admin_users_url, notice: "ユーザー情報を削除しました"
  end

end
