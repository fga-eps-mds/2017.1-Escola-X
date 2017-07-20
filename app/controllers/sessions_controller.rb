#File name: session_controller.rb
#Class name: SessionsController
#Description: Control the session login of the users
class SessionsController < ApplicationController
  include SessionsHelper
  include ReaderHelper
  include SchoolMissesHelper

  def create
    if ( !Alumn.find_by_registry(params[:login]).nil? )
      @user = Alumn.find_by_registry(params[:login])
    elsif ( !Parent.find_by_login(params[:login]).nil? )
      @user = Parent.find_by_login(params[:login])
    elsif ( !Employee.find_by_registry(params[:login]).nil? )
      @user = Employee.find_by_registry(params[:login])
    end

    if ( @user and @user.authenticate(params[:password]) )
      cookies[:authorization_token] = @user.authorization_token
      if (is_alumn?)
        redirect_to alumn_path(@user)
      elsif (is_parent?)
        redirect_to parent_alumns_path(@user)
      elsif (is_teacher?)
        redirect_to teacher_path(@user)
      elsif(is_secretary?)
        redirect_to secretary_path(@user)
      elsif (is_principal?)
        redirect_to users_path
      end

      # Se chegou aqui conseguiu fazer o login
      date = mountCurrentDate()
      data_exists = check_if_date_exits(date)
      if(data_exists == false)
        #create new data
        give_fault_to_all_alumns(date)
        DayOfClass.create(date:date)
      else
        #data already exists
        #nothing to do
      end


    else
      redirect_to root_url, notice: "Login e/ou senha incorreta(s)!"
    end
  end

  def destroy
    cookies.delete(:authorization_token)
    redirect_to root_url
  end


  def check_if_date_exits(date)
    days_of_class = DayOfClass.all

    data_exists = false
    for day_of_class in days_of_class

      if (day_of_class.date.to_s == date.to_s)
        data_exists = true;
      end
    end

    return data_exists
  end

  def login_helper
  end

end
