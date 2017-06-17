# File name: parents_controller.rb
# Class name: ParentsController
# Description: Controller used to communicate with the view highways/show
class ParentsController < ApplicationController
  include SessionsHelper

  def index
    if ( is_employee? )
      @parents = Parent.all
    else
      redirect_to "/errors/error_500"
    end
  end

  def show
    id = params[:id]

    if ( is_employee? or verify_parent(id) or is_related?(id) )
      @parent = Parent.find(id)
    else
      redirect_to "/errors/error_500"
    end
  end

  def new
    if ( is_principal? )
      @parent = Parent.new
    else
      redirect_to "/errors/error_500"
    end
  end

  def edit
    if ( is_principal? )
      @parent = Parent.find(params[:id])
    else
      redirect_to "/errors/error_500"
    end
  end

  def create
    if ( is_principal? )
      @parent = Parent.new(parent_params)

      if (@parent.save)
        redirect_to new_parent_alumn_path(@parent)
      else
        render 'new'
      end
    else
      redirect_to "/errors/error_500"
    end
  end

  def update
    if ( is_principal? )
      @parent = Parent.find(params[:id])
      if ( @parent.update(parent_params) )
        flash[:notice] = "Responsável alterado(a) com sucesso"
        redirect_to @parent
      else
        render 'edit'
      end
    else
      redirect_to "/errors/error_500"
    end
  end

  def destroy
    if ( is_principal? )
      @parent = Parent.find(params[:id])
      @parent.destroy
      flash[:alert] = "Responsável excluído(a) com sucesso"
      redirect_to users_path
    else
      redirect_to "/errors/error_500"
    end
  end

  def edit_password_parent
    if ( is_principal? )
      @user = Parent.find(params[:id])
      render action: "../users/edit_password"
    else
      redirect_to "/errors/error_500"
    end
  end

  def update_password_parent
    if ( is_principal? )
      @user = Parent.find(params[:id])
      if (@user.update!(parent_params))
        redirect_to @user
      else
        render action: "../users/edit_password"
      end
    else
      redirect_to "/errors/error_500"
    end
  end

  private
  def parent_params
    params.require(:parent).permit(:parent_cpf,
                                   :name,
                                   :address,
                                   :phone,
                                   :gender,
                                   :birth_date,
                                   :password)
  end
end
