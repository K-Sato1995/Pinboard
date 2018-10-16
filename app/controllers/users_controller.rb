class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @pins = current_user.pins
    @likedpins = @user.find_voted_items
  end

  def edit
    @user = current_user.id
  end

  def update
    @user= User.find(params[:id])
    @user.update(user_params)
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :avatar, :email, :password)
  end
end
