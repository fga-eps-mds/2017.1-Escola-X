class ClassroomsController < ApplicationController
  include SessionsHelper

  def index
    if ( is_principal? )
      @classrooms = Classroom.all
    end
  end

  def new
    if (is_principal?)
      @classroom = Classroom.new
    end
  end

  def show
    if ( is_principal? )
      @classroom = Classroom.find(params[:id])
    end
  end

  def create
    if (is_principal?)
      @classroom = Classroom.create(classroom_params)
      if (@classroom.save)
        redirect_to classroom_path(@classroom)
      else
        render 'classrooms/new'
      end
    end
  end

  def destroy
  if ( is_principal? )
    @classroom = Classroom.find(params[:id])
    @classroom.destroy
    redirect_to users_path
  end
end

def edit
  if ( is_principal? )
    @classroom = Classroom.find(params[:id])
  end
end

def update
  if ( is_principal? )
    @classroom = Classroom.find(params[:id])
    if @classroom.update(classroom_params)
      redirect_to classroom_path(@classroom)
    else
      render "classrooms/edit"
    end
  end
end

def add_alumns
  if ( is_principal? )
    @classroom = Classroom.find(params[:id])
    @alumns = @classroom.alumn
  end

end

def add_alumn
  if ( is_principal? )
    @classroom = Classroom.find(params[:id])
    @alumns = @classroom.alumn
    @alumn = Alumn.find_by_registry(params[:registry])
    @alumn.classroom_id = @classroom.id
    if @alumn.save
      render "classrooms/add_alumns"
    else
      render "classrooms/add_alumns"
    end
  end

end

private
  def classroom_params
    params.require(:classroom).permit(:name_classroom,
                                      :shift_classroom)
  end
end
