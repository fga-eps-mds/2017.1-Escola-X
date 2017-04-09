class UsersController < ApplicationController
  include SessionsHelper

  def index
    if logged_in?
      #method
    end
  end

  def show
    if logged_in?
      #method
    end
  end

  def new
    if logged_in?
      #method
    end
  end

  def edit
    if is_principal?
      #method
    end
  end

  def create
    if is_principal?
      #method
    end
  end

  def update
    if is_principal?
      #method
    end
  end

  def destroy
    if is_principal?
      #method
    end
  end

  def password_reset
    if is_principal?
      @user = User.find(parms[:id])
      if @user.update(params[:password])
        redirect_to @user
      else
        #error
      end
    end
  end

end
