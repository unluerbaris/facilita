class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @events = Event.where(user: @user)
    authorize @user
  end

end
