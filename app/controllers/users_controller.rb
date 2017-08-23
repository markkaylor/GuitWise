class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @this_user = User.find(params[:id])
  end
end
