class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id])
  end

  def show
    @posts = Post.where(author_id: params[:user_id], id: params[:id]).first
    @comment = Comment.new
    @like = Like.new
  end

  def new
    @posts = Post.new
  end

  def create
    @posts = current_user.posts.new(post_param)
    if @posts.save
      redirect_to user_post_path(current_user, @posts)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_param
    params.require(:post).permit(:title, :text)
  end
end
