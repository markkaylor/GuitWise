class CommentsController < DeviseController

   def upvote
    @comment = Comment.find(params[:id])
    vote = @comment.votes.new
    vote.user = current_user
    vote.value = 1
    if Vote.find_by(user: current_user, value: -1)
      Vote.find_by(user: current_user, value: -1).destroy
    end
    vote.save
    redirect_to(post_path(@comment.post))
  end

  def downvote
    @comment = Comment.find(params[:id])
    vote = @comment.votes.new
    vote.user = current_user
    vote.value = -1
    if Vote.find_by(user: current_user, value: 1)
      Vote.find_by(user: current_user, value: 1).destroy
    end
    vote.save
    redirect_to(post_path(@comment.post))
  end

  def create
    @comment = Comment.new(comment_params)
    @post = Post.find(params[:post_id])

    @comment.user = current_user
    @comment.post = @post

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
    params.require(:comment).permit(:video_url, :content)
  end


   # Gets the actual resource stored in the instance variable
  def resource
    @user = resource_name.to_s.capitalize.constantize.new
  end
end
