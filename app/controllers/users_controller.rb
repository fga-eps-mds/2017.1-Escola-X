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

  def new_alumn
    @user = User.new

  end

  def new_parent
    @user = User.new

  end

  def edit
    @user = set_user
  end

  def edit_alumn
    @user = set_user
  end

  def edit_parent
    @user = set_user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      if @user.permission == "Alumn"
        redirect_to alumn_path(@user)
      end
      if @user.permission == "Parent"
        redirect_to parent_path(@user)
      end
    else
      redirect_to :back
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
      redirect_to @user
    else
      render 'edit'
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

 def user_params
   params.require(:user).permit(:name, :address, :phone, :gender, :birth_date, :permission,
    parent_attributes: [:parent_cpf], alumn_attributes: [:registry, :shift])
 end

  # Strong params to be passed to users
#  def user_params
#    params.require(:user).permit(:name,
#                                 :address,
#                                 :phone,
#                                 :gender,
#                                 :birth_date,
#                                 alumn_attributes: [:registry, :shift])
#  end
end
