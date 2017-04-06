#File name: session_controller.rb
#Class name: SessionsController
#Description: Control the session login of the users
class SessionsController < ApplicationController

  def create
      if !!User.find_by_registry(params[:login])
        user =  User.find_by_registry(params[:login])
      else
        user =  User.find_by_cpf(params[:login])
      end

      if user && user.authenticate(params[:password])
        cookies[:authorization_token] = user.authorization_token
        redirect_to #to define
      else
        redirect_to #root
        #Show error
      end
  end

  def destroy
    cookies.delete(:authorization_token)
    redirect_to #root
  end
end
