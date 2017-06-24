
class PrincipalController < ApplicationController
  include SessionsHelper

  def show
    if ( is_principal? )
      @principal = Employee.find(params[:id])
    end
  end

  def edit
    if ( is_principal? )
      @principal = Employee.find(params[:id])
    end
  end

  def update
    if ( is_principal? )
      @principal = Employee.find(params[:id])
      if ( @principal.update(principal_params) )
        flash[:notice] = "Diretor(a) alterado(a) com sucesso"
        redirect_to @principal
      else
        render 'edit'
      end
    end
  end

private
  def principal_params
    params.require(:principal).permit(:registry,
																			:admission_date,
																			:employee_cpf,
																			:password,
																			:name,
																			:phone,
																			:gender,
																			:birth_date)

  	end
end
