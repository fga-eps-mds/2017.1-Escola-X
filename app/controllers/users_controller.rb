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
    else
      redirect_to "/errors/error_500"
    end
  end
end
