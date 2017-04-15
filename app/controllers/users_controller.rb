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
    @user = User.new
  end

  def edit
    @user = set_user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
      @parent= Parent.find(params[:id])
      @parent.destroy

      redirect_to parents_path
  end


  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def destroy
    set_user
    @user.destroy
    redirect_to users_path
  end

  def set_user
    @user = User.find(params[:id])
  end

private
  def user_params
    params.require(:user).permit(:name, :address, :phone, :gender, :birth_date,
     parent_attributes: [:parent_cpf])
  end

end
