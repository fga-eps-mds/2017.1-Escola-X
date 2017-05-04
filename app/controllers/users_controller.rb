# File name: users_controller.rb
# Class name: UsersController
# Description: Controller used to making sense of the request users
class UsersController < ApplicationController
  include SessionsHelper

  def index
    if ( logged_in? )
      @users = Alumn.all
    end
  end

  def show
    if (logged_in?)
      @user = User.find(params[:id])
    end
  end

  def edit_password
    if ( is_principal? )
      @user = User.find(params[:id])
    end
  end

private

  def user_params
    params.require(:user).permit(:name,
                                 :address,
                                 :phone,
                                 :gender,
                                 :birth_date,
                                 :permission,
                                 :image,
                                 :password,
                                 :parent_cpf,
                                 :registry,
                                 :shift)
  end
end
