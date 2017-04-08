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

end
