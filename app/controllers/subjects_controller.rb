# File name: subjects_controller.rb
# Class name: SubjectsController
# Description: Controller used to communicate with the proprietary view of subjects
class SubjectsController < ApplicationController
	include SessionsHelper

  def index
  	if ( is_principal? or is_teacher? )
  		@subjects = Subject.all
    else
      redirect_to "/errors/error_500"
  	end
  end

	def classroom_subjects
		@classroom = Classroom.find(params[:id])
		@subjects = @classroom.subjects
	end

  def new
  	if ( is_principal? )
  		@subject = Subject.new
    else
      redirect_to "/errors/error_500"
  	end
  end

  def edit
  	if ( is_principal? )
    	@subject = Subject.find(params[:id])
    else
      redirect_to "/errors/error_500"
    end
  end

  def show
  	if( is_principal? )
  		@subject = Subject.find(params[:id])
    else
      redirect_to "/errors/error_500"
  	end
  end

  def create
  	if ( is_principal? )
			@subject = Subject.new(subject_params)
			@teacher = Teacher.find_by_registry(params[:teacher_registry])
			if ( @teacher.nil? )
				@subject.save
				render 'new'
			else
				@subject.teacher_id = @teacher.id
	  		if ( @subject.save )
					flash[:success] = "Matéria criada com sucesso"
	    		redirect_to @subject
	    	else
	    		render 'new'
	    	end
	    end
    else
      redirect_to "/errors/error_500"
		end
  end

  def destroy
  	if ( is_principal? )
  		@subject = Subject.find(params[:id])
  		@subject.destroy
			flash[:alert] = "Turma excluída com sucesso"
  		redirect_to subjects_path
    else
      redirect_to "/errors/error_500"
  	end
  end

  def update
  	if ( is_principal? )
			@subject = Subject.find(params[:id])
			@teacher = Teacher.find_by_registry(params[:teacher_registry])
			if ( @teacher.nil? )
				@subject.update(subject_params)
				render 'edit'
			else
				@subject.teacher_id = @teacher.id
	  		if ( @subject.update(subject_params) )
					flash[:notice] = "Matéria alterada com sucesso"
	    		redirect_to @subject
	    	else
	    		render 'edit'
	    	end
	    end
    else
      redirect_to "/errors/error_500"
		end
  end

  def add_classrooms
    if ( is_principal? )
      @classroom = Classroom.find(params[:id])
      @subjects = Subject.all
    end
  end

  def add_classroom
    if ( is_principal? )
      @classroom = Classroom.find(params[:id])
      @subject = Subject.find(params[:subject_id])
			if !((ClassroomSubject.where(classroom_id: @classroom.id).where(subject_id: @subject.id)).exists?)
				@classroom_subject = ClassroomSubject.new
				@classroom_subject.subject_id = @subject.id
				@classroom_subject.classroom_id = @classroom.id
				if @classroom_subject.save
					redirect_to add_classrooms_path(@classroom)
				end
			else
				redirect_to add_classrooms_path(@classroom)
			end
    end
  end

  def show_subjects
    @classroom = Classroom.find(params[:id])
    @subjects = @classroom.subject
  end

  private
  def subject_params
  	params.require(:subject).permit(:name_subject,:class_level,:teacher_id,:classroom_id,:subject_id)
  end
end
