class GradesController < ApplicationController
  include SessionsHelper

  def index
    if (is_secretary?)
      @classrooms = Classroom.all
    end
  end

  def new
    if (is_secretary?)
      @grade = Grade.new
    end
  end

  def show
    if (is_secretary?)
      @grade = Grade.find(params[:id])
    end
  end

  def create
    if (is_secretary?)
      @grade = grade.create(grade_params)
      if (@grade.save)
        #redirect_to grade_path(@grade)
      else
        #render 'grades/new'
      end
    end
  end

  def destroy
  if (is_secretary?)
    @grade = grade.find(params[:id])
    @grade.destroy
    redirect_to users_path
  end
end

def edit
  if ( is_secretary? )
    @grade = grade.find(params[:id])
  end
end

def update
  if ( is_secretary? )
    @grade = grade.find(params[:id])
    if @grade.update(grade_params)
      redirect_to grade_path(@grade)
    else
      render "grades/edit"
    end
  end
end

private
  def grade_params
    params.require(:grade).permit(:grade_01,
                                  :grade_02,
                                  :grade03,
                                  :grade04,
                                  :grade_final,
                                  :alumn_id,
                                  :subject_id)
  end
end
