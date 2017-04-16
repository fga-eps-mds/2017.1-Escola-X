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
      if @user.permission == "Alumn"
        redirect_to alumn_path(@user.alumn)
      end
      if @user.permission == "Parent"
        redirect_to parent_path(@user.parent)
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
      if @user.permission == "Alumn"
        redirect_to alumn_path(@user.alumn  )
      end
      if @user.permission == "Parent"
        redirect_to parent_path(@user.parent)
      end
    else
      debugger
      redirect_to :back
    end
  end

private

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
