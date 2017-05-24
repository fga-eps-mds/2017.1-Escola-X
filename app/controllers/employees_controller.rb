# File name: employees_controller.rb
# Class name: EmployeesController
# Description: Controller used to communicate with the view highways/show

class EmployeesController < UsersController
	include SessionsHelper

  def index
    if ( logged_in? )
      @employees = Employee.all
    end
  end

	def edit_password_employee
		if ( is_principal? )
			@user = Employee.find(params[:id])
			render action: "../users/edit_password"
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
		end
	end

private
  def employee_params
    params.require(:employee).permit(	:registry,
																			:admission_date,
																			:employee_cpf,
																			:shift,
																			:password,
																			:name,
																			:address,
																			:phone,
																			:gender,
																			:birth_date)

  end
end
