class SubjectsController < ApplicationController
	include SessionsHelper

  def index
  	if (is_principal?)
  		@subjects = Subject.all
  	end
  end

  def new
  	if ( is_principal? )
  		@subject = Subject.new
  	end
  end

  def edit
  	if ( is_principal? )
    	@subject = Subject.find(params[:id])
    end
  end

  def show
  	if(is_principal?)
  		@subject = Subject.find(params[:id])
  	end
  end

  def create
  	if (is_principal?)
			@subject = Subject.new(subject_params)
			@teacher = Teacher.find_by_registry(params[:teacher_registry])
			if (@teacher.nil?)
				@subject.save
				render 'new'
			else
				@subject.teacher_id = @teacher.id
	  		if (@subject.save)
	    		redirect_to @subject
	    	else
	    		render 'new'
	    	end
	    end
		end
  end

  def destroy
  	if ( is_principal? )
  		@subject = Subject.find(params[:id])
  		@subject.destroy

  		redirect_to subjects_path
  	end
  end

  def update
  	if ( is_principal? )
			@subject = Subject.find(params[:id])
			@teacher = Teacher.find_by_registry(params[:teacher_registry])
			if (@teacher.nil?)
				@subject.update(subject_params)
				render 'edit'
			else
				@subject.teacher_id = @teacher.id
	  		if (@subject.update(subject_params))
	    		redirect_to @subject
	    	else
	    		render 'edit'
	    	end
	    end
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
      @subject = Subject.find(params[:id])
      @subject.classroom_id = @classroom.id
      @subject.save
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
