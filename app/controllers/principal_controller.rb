require 'set'

class PrincipalController < ApplicationController
  include SessionsHelper

	def edit_password_employee
		if ( is_principal? )
			@user = Employee.find(params[:id])
			render action: 	"../users/edit_password"
		else
      		redirect_to "/errors/error_500"
		end
	end

	def update_password_employee
		if ( is_principal? )
			@user = Employee.find(params[:id])
			if (@user.update!(employee_params))
				redirect_to @user
			else
				render action: "../users/edit_password"
			end
		else
      		redirect_to "/errors/error_500"
		end
	end

  def show
    if ( is_principal? )
      @employee = Employee.find(params[:id])
    end
  end

  def edit
    if ( is_principal? )
      @employee = Employee.find(params[:id])
    end
  end

  def update
    if ( is_principal? )
      @employee = Employee.find(params[:id])
      if ( @employee.update(employee_params) )
        redirect_to @employee
      else
        render 'edit'
      end
    end
  end

private
  def employee_params
    params.require(:employee).permit(	:registry,
																			:admission_date,
																			:employee_cpf,
																			:password,
																			:name,
																			:phone,
																			:gender,
																			:birth_date)

  	end
end
