class ClassroomsController < ApplicationController
  include SessionsHelper

  def index

  end

  def new
    if (is_principal?)
      @classroom = Classroom.new
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
private
  def classroom_params
    params.require(:classroom).permit(:name_classroom,
                                      :shift_classroom)
  end
end
