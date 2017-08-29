class PagesController < DeviseController
  skip_before_action :authenticate_user!, only: [:home, :about]

  def home
    @posts = Post.last(10)
    if current_user
      @follow_posts = []
      follow_post_ids.max(10).each do |id|
        @follow_posts << Post.find(id)
      end
    end
  end

  def about
  end

  private
   # Gets the actual resource stored in the instance variable
  def resource
    @user = resource_name.to_s.capitalize.constantize.new
  end

  def follow_post_ids
    if current_user
      array = []
      current_user.followings.each do |f|
        User.find(f.following).posts.each do |p|
          array << p.id
        end
      end
      return array
    end
  end
end
