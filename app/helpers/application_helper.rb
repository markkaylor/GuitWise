module ApplicationHelper
  def avatar_url
    if current_user.photo
      @avatar_url = cl_image_path current_user.photo.path, height: 150, width: 150, crop: :thumb, gravity: :face
    elsif current_user.facebook_picture_url
      @avatar_url = current_user.facebook_picture_url
    else
      @avatar_url = image_url "logo.png"
    end
  end

  def this_avatar_url
    if User.find(params[:id]).photo
      @avatar_url = cl_image_path User.find(params[:id]).photo.path, height: 150, width: 150, crop: :thumb, gravity: :face
    elsif User.find(params[:id]).facebook_picture_url
      @avatar_url = User.find(params[:id]).facebook_picture_url
    else
      @avatar_url = image_url "logo.png"
    end
  end

  def post_avatar_url(post)
    if User.find(post.user_id).photo
      @avatar_url = cl_image_path User.find(post.user_id).photo.path, height: 150, width: 150, crop: :thumb, gravity: :face
    elsif User.find(post.user_id).facebook_picture_url
      @avatar_url = User.find(post.user_id).facebook_picture_url
    else
      @avatar_url = image_url "logo.png"
    end
  end
end
