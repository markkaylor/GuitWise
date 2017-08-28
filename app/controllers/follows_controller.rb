class FollowsController < DeviseController
  def create
    follower = current_user
    following = User.find(params[:user_id])
    follow = Follow.create(follower: follower, following: following)
    redirect_to user_path(following), notice: "You are now following #{following.name}"
  end

  def destroy
    follow = Follow.find(params[:id])
    following = follow.following
    follow.destroy
    redirect_to user_path(following), alert: "You are not following #{following.name}"
  end

  private
   # Gets the actual resource stored in the instance variable
  def resource
    @user = resource_name.to_s.capitalize.constantize.new
  end
end
