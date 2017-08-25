class PostsController < ApplicationController
  before_action :set_post, only: [:show, :destroy, :edit, :update]
  skip_before_action :authenticate_user!, only: [ :show, :index ]

  # Terminal instructions to start and check the elasticsearch
  # sudo service elasticsearch start
  # tail /var/log/elasticsearch/elasticsearch.log


  def index
    @posts = Post.search(params[:search], misspellings: {edit_distance: 5})
    @number = @posts.count
  end

  def show
    @related = Post.search(@post.title, operator: "or")
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
