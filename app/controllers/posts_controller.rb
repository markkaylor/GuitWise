class PostsController < DeviseController
  before_action :set_post, only: [:show, :destroy, :edit, :update]
  skip_before_action :authenticate_user!, only: [ :show, :index ]
  before_action :set_post_new
  # Terminal instructions to start and check the elasticsearch
  # sudo service elasticsearch start
  # tail /var/log/elasticsearch/elasticsearch.log


  def index
    @posts = Post.search(params[:search], misspellings: {edit_distance: 5})
    @number = @posts.count
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post_new = Post.new(post_params)
    @post_new.user = current_user
    @post_new.save
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :video_url, :content, :tag)
  end


   # Gets the actual resource stored in the instance variable
  def resource
    @user = resource_name.to_s.capitalize.constantize.new
  end

  def set_post_new
    @post_new = Post.new
  end
end
