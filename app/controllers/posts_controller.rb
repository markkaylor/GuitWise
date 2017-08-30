class PostsController < DeviseController
  before_action :set_post, only: [:show, :destroy, :edit, :update]
  skip_before_action :authenticate_user!, only: [ :show, :index ]

  # Terminal instructions to start and check the elasticsearch
  # sudo service elasticsearch start
  # tail /var/log/elasticsearch/elasticsearch.log
  def upvote
    @post = Post.find(params[:id])
    vote = @post.votes.new
    vote.user = current_user
    vote.value = 1
    if Vote.find_by(user: current_user, value: -1)
      Vote.find_by(user: current_user, value: -1).destroy
    end
    vote.save
    redirect_to(post_path(@post))
  end

  def downvote
    @post = Post.find(params[:id])
    vote = @post.votes.new
    vote.user = current_user
    vote.value = -1
    if Vote.find_by(user: current_user, value: 1)
      Vote.find_by(user: current_user, value: 1).destroy
    end
    vote.save
    redirect_to(post_path(@post))
  end

  def index
    @posts = Post.search(params[:search], misspellings: {edit_distance: 5})
    @number = @posts.count
  end

  def show
    @comment = Comment.new
    render layout: "post_layout"
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.content = "" unless @post.content
    @post.tag = "" unless @post.tag
    @post.user = current_user
    if @post.save
      redirect_to post_path(@post)
    else
      redirect_to new_post_path
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
    params.require(:post).permit(:title, :video_url, :content, :tag)
  end


   # Gets the actual resource stored in the instance variable
  def resource
    @user = resource_name.to_s.capitalize.constantize.new
  end
end
