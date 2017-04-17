# File name: users_controller.rb
# Class name: UsersController
~~~~~~ dev_crud_alumn
# Description: Controller used to making sense of the request users
class UsersController < ApplicationController
  include SessionsHelper

  def index
    if (logged_in?)
      @users = User.all
    end
  end

  def show
    if (logged_in?)
      @user = set_user
    end
  end


  def create
    if(is_principal?)
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
  end

  def destroy
    if(is_principal?)
      @parent= Parent.find(params[:id])
      @parent.destroy
      redirect_to parents_path
    end
  end

  def update
    if(is_principal?)
      @user = User.find(params[:id])
      if @user.update(user_params)
        if @user.permission == "Alumn"
          redirect_to alumn_path(@user.alumn  )
        end
        if @user.permission == "Parent"
          redirect_to parent_path(@user.parent)
        end
      else
        redirect_to :back
      end
    end
  end

  def edit_password
    if (is_principal?)
      @user = User.find(params[:id])
    end
  end

private

 def user_params
   params.require(:user).permit(:name, :address, :phone, :gender, :birth_date, :permission,
    parent_attributes: [:parent_cpf], alumn_attributes: [:registry, :shift])
 end
