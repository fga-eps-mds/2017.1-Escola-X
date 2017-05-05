# File name: secretary_controller.rb
# Class name: SecretaryController
# Description: Controller used to communicate with the proprietary view of secretarys

class SecretaryController < ApplicationController
	include SessionsHelper

  def index
    if ( is_principal? )
      @secretary = Employee.all
    end
  end


  def show
    if ( logged_in? )
      @secretary = Employee.find(params[:id])
    end
  end


  def new
    if ( is_principal? )
      @secretary = Employee.new
    end
  end


  def edit
    if ( is_principal? )
      @secretary = Employee.find(params[:id])
    end
  end


  def create
    if ( is_principal? )
      @secretary = Employee.new(secretary_params)

      if (@secretary.save)
        redirect_to @secretary
      else
        render 'new'
      end
    end
  end


  def update
    if ( is_principal? )
      @secretary = Employee.find(params[:id])
      if ( @secretary.update(secretary_params) )
        redirect_to @secretary
      else
        render 'edit'
      end
    end
  end

  def destroy
    if ( is_principal? )
      @secretary = Employee.find(params[:id])
      @secretary.destroy

      redirect_to users_path
    end
  end

  private

  def secretary_params
  	params.require(:employee).permit( :employee_cpf,
								       :admission_date,
								       :shift,
								       :name,
								       :address,
								       :phone,
								       :gender,
								       :birth_date,
								       :permission,
								       :password_digest)
  end

end
