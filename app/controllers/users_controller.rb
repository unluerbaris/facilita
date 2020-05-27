class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @events = Event.where(user: @user).reverse
    authorize @user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    @user.save
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :photo)
  end

end
