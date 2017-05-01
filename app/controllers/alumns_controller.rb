# File name: alumns_controller.rb
# Class name: AlumnsController
# Description: Controller used to communicate with the proprietary view of alumns
 class AlumnsController < ApplicationController
  include SessionsHelper

  def index
    if ( is_parent? )
      @alumns = @current_user.alumns
    elsif ( logged_in? )
      @alumns = Alumn.all
    end
  end

  def show
    if ( logged_in? )
      @alumn = Alumn.find(params[:id])
    end
  end

  def new
    if ( is_principal? )
      @alumn = Alumn.new
      @@parent = Parent.find(params[:parent_id])
    end
  end

  def edit
    if ( is_principal? )
      @alumn = Alumn.find(params[:id])
    end
  end

  def create
    if ( is_principal? )
      @alumn = Alumn.new(alumn_params)
      @alumn.parent_id = @@parent.id

      if (@alumn.save)
        redirect_to @alumn
      else
        render 'new'
      end
    end
  end

  def update
    if ( is_principal? )
      @alumn = Alumn.find(params[:id])
      if ( @alumn.update(parent_params) )
        redirect_to @alumn
      else
        render 'edit'
      end
    end
  end

  def destroy
    if ( is_principal? )
      @alumn = Alumn.find(params[:id])
      @alumn.destroy

      redirect_to users_path
    end
  end

 private
   # Strong params to be passed to a alumn
   def alumn_params
     params.require(:alumn).permit(:registry,
                                   :shift,
<<<<<<< HEAD
                                  #  :image,
                                   user_attributes:[:name,
                                                    :address,
                                                    :phone,
                                                    :gender,
                                                    :image,
                                                    :birth_date,
                                                    :permission])
=======
                                   :name,
                                   :address,
                                   :phone,
                                   :gender,
                                   :birth_date,
                                   :permission,
                                   :password,
                                   :parent_id)
>>>>>>> devel_refactoring
   end
  end
