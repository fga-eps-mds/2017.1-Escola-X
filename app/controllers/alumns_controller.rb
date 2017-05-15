# File name: alumns_controller.rb
# Class name: AlumnsController
# Description: Controller used to communicate with the proprietary view of alumns
 class AlumnsController < ApplicationController
  include SessionsHelper

  def index
    if ( is_parent? )
      @alumns = @current_user.alumns
    elsif ( is_employee? )
      @alumns = Alumn.all
      if params[:search]
        @alumns = Alumn.search(params[:search]).order("created_at DESC")
        if (@alumns.empty?)
           flash.now[:feedback] = "Nenhum(a) aluno(a) encontrado!"
        elsif (params[:search].blank?)
           @alumns = Alumn.all.order('created_at DESC')
          flash.now[:feedback_warning] = "Digite algo para pesquisar!"
        end
      else
        @alumns = Alumn.all.order('created_at DESC')
      end
    end
  end

  def show
    if ( logged_in? )
      @alumn = Alumn.find(params[:id])
      Alumn.current = @alumn
    end
  end

  def new
    if ( is_principal? )
      @alumn = Alumn.new
      @@parent = Parent.find(params[:parent_id])
      @classrooms = Classroom.all.order('name_classroom')
    end
  end

  def edit
    if ( is_principal? )
      @alumn = Alumn.find(params[:id])
      @classrooms = Classroom.all.order('name_classroom')
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
      if @alumn.update alumn_params
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
                                   :name,
                                   :address,
                                   :phone,
                                   :gender,
                                   :birth_date,
                                   :password,
                                   :parent_id,
                                   :classroom_id)
   end
  end
