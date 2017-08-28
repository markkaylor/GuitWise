class PagesController < DeviseController
  skip_before_action :authenticate_user!, only: [:home]
  before_action :set_post_new
  def home
    @posts = Post.all
  end

  private
   # Gets the actual resource stored in the instance variable
  def resource
    @user = resource_name.to_s.capitalize.constantize.new
  end

  def set_post_new
    @post_new = Post.new
  end
end
