# File name: users_controller.rb
# Class name: UsersController
# Description: Controller used to making sense of the request users
class UsersController < ApplicationController
  include SessionsHelper

  def index
    if ( is_employee? )
      @alumns = Alumn.all
      @employees = Employee.all
      @parents = Parent.all
    end
  end

  def edit_password
    if ( is_principal? )
      @user = Alumn.find(params[:id])
    end
  end

  def edit_password
    if ( is_principal? )
      @user = Alumn.find(params[:id])
    end
  end
end
