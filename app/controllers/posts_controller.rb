class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.includes(:author).where(author_id: params[:user_id])
  end

  def show
    @post = Post.includes(:author, comments: :user, likes: :user).where(author_id: params[:user_id], id: params[:id]).first
    @comment = Comment.new
    @like = Like.new
  end
  

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to user_post_path(current_user, @post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
