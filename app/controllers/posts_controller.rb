class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)

    if @post.save
        redirect_to new_post_path
    else
        render :new, status: :unprocessable_entity
    end
  end

  private
  def post_params
      params.require(:post).permit(:title, :body)
  end

end
