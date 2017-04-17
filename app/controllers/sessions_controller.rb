#File name: session_controller.rb
#Class name: SessionsController
#Description: Control the session login of the users
class SessionsController < ApplicationController
  def create
      if ( !Alumn.find_by_registry(params[:login]).nil? )
        alumn =  Alumn.find_by_registry(params[:login])
        user = User.find(alumn.user_id)
      elsif ( !Parent.find_by_parent_cpf(params[:login]).nil? )
        parent =  Parent.find_by_registry(params[:login])
        user = User.find(parent.user_id)
      elsif ( !Employee.find_by_cpf(params[:login]).nil? )
        employee =  Employee.find_by_cpf(params[:login])
        user = User.find(employee.user_id)
      end

      if ( user and user.authenticate(params[:password]) )
        cookies[:authorization_token] = user.authorization_token
          redirect_to users_path
      else
        redirect_to root_url, notice: "Login or password not valid"
      end
  end

  def destroy
    cookies.delete(:authorization_token)
    redirect_to root_url
  end
end
