class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.save
    flash[:notice] = "投稿しました"
    redirect_to posts_url
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
end
