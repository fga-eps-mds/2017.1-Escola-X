# File name: parents_controller.rb
# Class name: ParentsController
# Description: Controller used to communicate with the view highways/show
class ParentsController < ApplicationController
  include SessionsHelper

  def index
    if ( logged_in? )
      @parents = Parent.all
    end
  end

  def show
    if ( logged_in? )
      @parent = Parent.find(params[:id])
    end
  end

  def new
    if ( is_principal? )
      @parent = Parent.new
    end
  end

  def edit
    if ( is_principal? )
      @parent = Parent.find(params[:id])
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
    end
  end

  def destroy
    if ( is_principal? )
      @parent = Parent.find(params[:id])
      @parent.destroy

      redirect_to users_path
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
                                   :permission,
                                   :password)
  end
end
