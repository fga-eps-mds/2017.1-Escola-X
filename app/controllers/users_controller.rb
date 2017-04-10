class UsersController < ApplicationController
  include SessionsHelper

  def index
    if logged_in?
      @users = User.all
    end
  end

  def show
    if logged_in?
      @user = User.find(params[:id])
    end
  end

  def new
    if is_principal?
      @user = User.new
    end
  end

  def edit
    # if is_principal?
      @user= User.find(params[:id])
    # end
  end

  def create
    if is_principal?
      #method
    end
  end

  def update
    # if is_principal?
      @user = User.find(params[:id])
    # end
  end

  def destroy
    if is_principal?
      #method
    end
  end

  def update_password
    if is_principal?
      @user = User.find(params[:id])
      debugger
      if @user.update(params[:password])
        redirect_to @user
      else
        #error
      end
    end
  end

end
