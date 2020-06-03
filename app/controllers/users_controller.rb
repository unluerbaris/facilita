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
    authorise @user
    @user.update
    if @user.save
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :photo, :birthday, :gender, :occupation)
  end

end
