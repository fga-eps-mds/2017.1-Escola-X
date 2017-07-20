# File name: employees_controller.rb
# Class name: EmployeesController
# Description: Controller used to communicate with the views of emplyoees

class EmployeesController < UsersController
	include SessionsHelper

	def index
    	if ( is_employee? )
      		@employees = Employee.all
      	else
      		redirect_to "/errors/error_500"
    	end
  	end


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
    if ( is_employee? )
      @employee = Employee.find(params[:id])
    end
  end

  def new
    if ( is_principal? )
			@shifts = Shift.all
      @employee = Employee.new
    end
  end

  def edit
    if ( is_principal? )
			@shifts = Shift.all
      @employee = Employee.find(params[:id])
    end
  end

  def create
    if ( is_principal? )
			@shifts = Shift.all
      @employee = Employee.new(employee_params)

      if (@employee.save)
        redirect_to users_path
      end
    end
  end

  def update
    if ( is_principal? )
			@shifts = Shift.all
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
																			:birth_date,
																			:shift_id)

  	end
end
