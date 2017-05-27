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
    end
  end

  def show
    if ( logged_in? )
      @secretary = Secretary.find(params[:id])
    end
  end

  def new
    if ( is_principal? )
      @secretary = Secretary.new
    end
  end

  def edit
    if ( is_principal? )
      @secretary = Secretary.find(params[:id])
    end
  end

  def create
    if ( is_principal? )
      @secretary = Secretary.new(secretary_params)
      if (@secretary.save)
        flash[:notice] = "Secretário(a) criado(a) com sucesso"
        redirect_to @secretary
      else
        render 'new'
      end
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
    end
  end

  def destroy
    if ( is_principal? )
      @secretary = Secretary.find(params[:id])
      if (@secretary.destroy)
        flash[:notice] = "Secretário(a) excluído(a) com sucesso"
      end
      redirect_to secretaries_path
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
