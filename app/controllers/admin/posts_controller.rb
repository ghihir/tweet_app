class Admin::PostsController < ApplicationController
  before_action :admin_required

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to admin_posts_url
  end
end
