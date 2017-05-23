# File name: employees_controller.rb
# Class name: EmployeesController
# Description: Controller used to communicate with the views of emplyoees
class EmployeesController < UsersController
	include SessionsHelper

  def index
    if ( logged_in? )
      @employees = Employee.all
    end
  end

  def show
    if ( logged_in? )
      @employee = Employee.find(params[:id])
    end
  end

  def new
    if ( is_principal? )
      @employee = Employee.new
    end
  end

  def edit
    if ( is_principal? )
      @employee = Employee.find(params[:id])
    end
  end

  def create
    if ( is_principal? )
      @employee = Employee.new(employee_params)
      if (@employee.save)
        redirect_to users_path
      end
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

  def destroy
    if ( is_principal? )
      @employee = Employee.find(params[:id])
      @employee.destroy
      redirect_to users_path
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
			if ( @user.update!(employee_params) )
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
