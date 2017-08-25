class CommentsController < ApplicationController
  def upvote
  end

  def downvote
  end

  def create
    @comment = Comment.new(comment_params)
    @post = Post.find(params[:post_id])
    if @comment.save
      redirect_to post_path(@post), :notice => "Your comment has been posted"
    else
      redirect_to post_path(@post), :notice => "Something went wrong, please try again"
    end
  end

  def new
    @comment = Comment.new
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(params[comment_params])

    redirect_to post_path(@comment.post_id), :notice => "Your comment has been updated"
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_path, :notice => "Your comment has been deleted!"
  end

  private

  def comment_params
    params.require(:comment).permit(:video_url, :content, :id, :post_id)
  end
end
