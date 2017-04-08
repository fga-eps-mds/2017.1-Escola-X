# File name: users_controller.rb
# Class name: UsersController
class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(users_params)
  end

  def create
    @user = User.new(users_params)
    @permission = :permission
    if (@user.save)
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])

    if (@user.update(users_params))
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])

    @user.destroy
  end

  private
  # Strong params to be passed to users
  def users_params
    params.require(:user).permit(:registry,
                                  :cpf,
                                  :name,
                                  :address,
                                  :phone,
                                  :gender,
                                  :birth_date,
                                  :classroom,
                                  :shift,
                                  :admission_date)
  end
end
