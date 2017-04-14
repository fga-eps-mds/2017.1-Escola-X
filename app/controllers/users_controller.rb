# File name: users_controller.rb
# Class name: UsersController
# Description: Controller used to making sense of the request users
class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = set_user
  end

  def new
    @user = User.new()
  end

  def edit
    @user = set_user
  end

  def create
      @user = User.new(user_params)
      if @user.save
      # debugger
      redirect_to @user
    else
      render action: 'new'
    end
  end

  def update
    @user = set_user
    # debugger
    if @user.update(user_params)
      redirect_to @user
    else
      render action: 'edit'
    end
  end

  def destroy
    set_user
    @user.destroy

    redirect_to users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  # Strong params to be passed to users
  def user_params
    params.require(:user).permit(:name,
                                 :address,
                                 :phone,
                                 :gender,
                                 :birth_date)
  end
end
