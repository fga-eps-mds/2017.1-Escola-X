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
    else
      redirect_to "/errors/error_500" 
    end
  end

  def show
    id = params[:id]

    if ( is_employee? or is_son?(id) or verify_alumn(id) )
      @alumn = Alumn.find(id)
      Alumn.current = @alumn
    else
      redirect_to "/errors/error_500" 
    end
  end

  def new
    if ( is_principal? )
      @alumn = Alumn.new
      @@parent = Parent.find(params[:parent_id])
      @classrooms = Classroom.all.order('name_classroom')
    else
      redirect_to "/errors/error_500" 
    end
  end

  def edit
    if ( is_principal? )
      @alumn = Alumn.find(params[:id])
      @classrooms = Classroom.all.order('name_classroom')
    else
      redirect_to "/errors/error_500" 
    end
  end

  def create
    if ( is_principal? )
      @alumn = Alumn.new(alumn_params)
      @alumn.parent_id = @@parent.id
      @classrooms = Classroom.all.order('name_classroom')
      if (@alumn.save)
        GradesController.create(@alumn)
        flash[:success] = "Aluno(a) criado(a) com sucesso"
        redirect_to @alumn
      else
        render 'new'
      end
    else
      redirect_to "/errors/error_500" 
    end
  end

  def update
    if ( is_principal? )
      @alumn = Alumn.find(params[:id])
      @classrooms = Classroom.all.order('name_classroom')
      if @alumn.update alumn_params
        GradesController.update_alumn(@alumn)
        flash[:notice] = "Aluno(a) alterado(a) com sucesso"
        redirect_to @alumn
      else
        render 'edit'
      end
    else
      redirect_to "/errors/error_500" 
    end
  end

  def destroy
    if ( is_principal? )
      @alumn = Alumn.find(params[:id])
      @alumn.destroy
      flash[:alert] = "Aluno(a) excluído(a) com sucesso"
      redirect_to users_path
    end
  end

  def edit_password_alumn
    if ( is_principal? )
      @user = Alumn.find(params[:id])
      render action: "../users/edit_password"
    else
      redirect_to "/errors/error_500" 
    end
  end

  def update_password_alumn
    if ( is_principal? )
      @user = Alumn.find(params[:id])
      if (@user.update!(alumn_params))
        redirect_to @user
      else
        render action: "../users/edit_password"
      end
    else
      redirect_to "/errors/error_500" 
    end
  end

  def report
      @alumn = Alumn.find(params[:id])
      if ( !(is_parent_related_to_alumn?(@alumn) or is_me?(@alumn) or is_principal?) )
        redirect_to @current_user
      end
  end

  private
  def alumn_params
    params.require(:alumn).permit(:registry,
                                  :shift,
                                  :name,
                                  :address,
                                  :phone,
                                  :gender,
                                  :image,
                                  :birth_date,
                                  :password,
                                  :parent_id,
                                  :classroom_id)
  end
end
