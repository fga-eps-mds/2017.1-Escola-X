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
end