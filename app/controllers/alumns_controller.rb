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
      @classrooms = Classroom.all.order('name_classroom')
      if (@alumn.save)
        flash[:success] = "Aluno(a) criado(a) com sucesso"
        redirect_to @alumn
      else
        render 'new'
      end
    end
  end

  def update
    if ( is_principal? )
      @alumn = Alumn.find(params[:id])
      @classrooms = Classroom.all.order('name_classroom')
      if @alumn.update alumn_params
        flash[:notice] = "Aluno(a) alterado(a) com sucesso"
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
      flash[:alert] = "Aluno(a) excluído(a) com sucesso"
      redirect_to users_path
    end
  end

  def edit_password_alumn
    if ( is_principal? )
      @user = Alumn.find(params[:id])
      render action: "../users/edit_password"
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
