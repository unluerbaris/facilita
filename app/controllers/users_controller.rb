class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @events = Event.where(user: @user).reverse
    authorize @user
  end

end
