class Api::V1::PostsController < Api::V1::BaseController
  def create
    @post = Post.new(post_params)
    @post.user = current_user
    byebug
    if @post.save
      render json: { status: :created }
    else
      render_error
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :video_url, :content, :tag)
  end
end
