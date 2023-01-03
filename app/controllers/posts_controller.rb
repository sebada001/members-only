class PostsController < ApplicationController
  before_action :verify_user
  skip_before_action :verify_user, only: [:index]

  def index
    @posts = Post.all
    @user = current_user
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
        redirect_to posts_path
    else
        render :new, status: :unprocessable_entity
    end
  end

  private
  def post_params
      params.require(:post).permit(:title, :body)
  end

  def verify_user
    unless user_signed_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to posts_path
    end
  end

end
