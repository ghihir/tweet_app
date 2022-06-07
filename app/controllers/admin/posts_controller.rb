class Admin::PostsController < ApplicationController
  before_action :admin_required

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to admin_posts_url, notice: "投稿を削除しました"
  end
end
