class PagesController < DeviseController
  skip_before_action :authenticate_user!, only: [:home, :about]

  def home
    @posts = Post.all
  end

  def about
  end

  private
   # Gets the actual resource stored in the instance variable
  def resource
    @user = resource_name.to_s.capitalize.constantize.new
  end
end
