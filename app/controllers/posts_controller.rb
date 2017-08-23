class PostsController < ApplicationController
  before_action :set_post, only: [:show, :destroy, :edit, :update]

  def index
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to post_path(@post)
    else
      redirect_to :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :video_url, :content)

  end
end
