class UsersController < DeviseController
  before_action :authenticate_user!
  before_action :set_post_new
  def show
    @this_user = User.find(params[:id])
  end


   # Gets the actual resource stored in the instance variable
  def resource
    @user = resource_name.to_s.capitalize.constantize.new
  end
  def set_post_new
    @post_new = Post.new
  end
end
