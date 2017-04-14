# File name: users_controller.rb
# Class name: UsersController
# Description: Controller used to communicate with the view users/show
class UsersController < ApplicationController
  include SessionsHelper
  # before_action :set_user, only:[:update] #If an error of @user=nill occur

  def index
    if (logged_in?)
      @users = User.all
    end
  end

  def show
    if (logged_in?)
      @user = User.find(params[:id])
    end
  end

  def new
    if (is_principal?)
      @user = User.new
    end
  end

  def edit
    if (is_principal?)
      @user = User.find(params[:id])
    end
  end

  def create
    if (is_principal?)
      @user = User.new(user_params)

      if @user.save
        redirect_to @user #Maybe change
      else
        render 'new'
      end
    end
  end

  def update
    if (is_principal?)
      @user = User.find(params[:id])
      if ( @user.update(user_params) )
        redirect_to @user, notice: "Usuário #{@user.name} foi atualizado!"
      else
        render 'edit'
      end
    end
  end

  def destroy
    if (is_principal?)
      @user = User.find(params[:id])
      @user.destroy

      redirect_to users_path
    end
  end

  def edit_password
    if (is_principal?)
      @user = permission_class.find(params[:id])
    end
  end

  private
  def user_params
    params.require(:user).permit(:name,:cpf,:address,:phone,:gender,:permission,:birth_date,:password)
  end
end
