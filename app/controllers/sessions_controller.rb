#File name: session_controller.rb
#Class name: SessionsController
#Description: Control the session login of the users
class SessionsController < ApplicationController
  include SessionsHelper
  def create
    if ( !Alumn.find_by_registry(params[:login]).nil? )
      alumn =  Alumn.find_by_registry(params[:login])
      user = User.find(alumn.user_id)
    elsif ( !Parent.find_by_parent_cpf(params[:login]).nil? )
      parent = Parent.find_by_parent_cpf(params[:login])
      user = User.find(parent.user_id)
    elsif ( !Employee.find_by_registry(params[:login]).nil? )
      employee = Employee.find_by_registry(params[:login])
      user = User.find(employee.user_id)
    end

    if ( user and user.authenticate(params[:password]) )
      cookies[:authorization_token] = user.authorization_token
      if (is_alumn?)
        redirect_to alumn_path(@current_user.alumn)
      elsif (is_principal?)
        redirect_to users_path
      elsif (is_parent?)
        #
      end
    else
      redirect_to root_url, notice: "Login or password not valid"
    end
  end

  def destroy
    cookies.delete(:authorization_token)
    redirect_to root_url
  end
end
