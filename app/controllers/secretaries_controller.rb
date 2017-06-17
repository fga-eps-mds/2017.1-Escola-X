# File name: secretaries_controller.rb
# Class name: SecretariesController
# Description: Controller used to communicate with the proprietary view of secretaries
class SecretariesController < ApplicationController
	include SessionsHelper

  def index
    if ( is_principal? )
      @secretaries = Secretary.all
      if params[:search]
        @secretaries = Secretary.search(params[:search]).order("created_at DESC")
        if (@secretaries.empty?)
          flash.now[:feedback] = "Nenhum secretário(a) encontrado!"
        end
        if params[:search].blank?
          @secretaries = Secretary.all.order('created_at DESC')
          flash.now[:feedback_warning] = "Digite algo para pesquisar!"
        end
      else
        @secretaries = Secretary.all.order('created_at DESC')
      end
    else
      redirect_to "/errors/error_500"
    end
  end

  def show
    if ( is_principal? or is_secretary? )
      @secretary = Secretary.find(params[:id])
    else
      redirect_to "/errors/error_500"
    end
  end

  def new
    if ( is_principal? )
      @secretary = Secretary.new
    else
      redirect_to "/errors/error_500"
    end
  end

  def edit
    if ( is_principal? )
      @secretary = Secretary.find(params[:id])
    else
      redirect_to "/errors/error_500"
    end
  end

  def create
    if ( is_principal? )
      @secretary = Secretary.new(secretary_params)
      if (@secretary.save)
        flash[:success] = "Secretário(a) criado(a) com sucesso"
        redirect_to @secretary
      else
        render 'new'
      end
    else
      redirect_to "/errors/error_500"
    end
  end

  def update
    if ( is_principal? )
      @secretary = Secretary.find(params[:id])
      if @secretary.update secretary_params
        flash[:notice] = "Secretário(a) alterado(a) com sucesso"
        redirect_to @secretary
      else
        render 'edit'
      end
    else
      redirect_to "/errors/error_500"
    end
  end

  def destroy
    if ( is_principal? )
      @secretary = Secretary.find(params[:id])
      if (@secretary.destroy)
        flash[:alert] = "Secretário(a) excluído(a) com sucesso"
      	redirect_to secretaries_path
      else
      	redirect_to "/errors/error_500"
      end
    end
  end

  private
  def secretary_params
  	params.require(:secretary).permit( :employee_cpf,
								       :admission_date,
								       :shift,
								       :name,
								       :address,
								       :phone,
								       :gender,
								       :birth_date,
								       :permission,
								       :password,
											 :registry)
  end
end
