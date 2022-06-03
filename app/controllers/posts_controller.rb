class PostsController < ApplicationController
  before_action :correct_user_required, only: [:edit, :destroy]

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params.merge(user_id: current_user.id))
    if @post.save
      flash[:notice] = "投稿しました"
      redirect_to posts_url
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    flash[:notice] = "更新しました"
    redirect_to posts_url
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:notice] = "削除しました"
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  def correct_user_required
    post = Post.find(params[:id])
    unless post.user_id == session[:user_id]
      flash[:notice] = "ログインしてください"
      redirect_to root_url
    end
  end
end
