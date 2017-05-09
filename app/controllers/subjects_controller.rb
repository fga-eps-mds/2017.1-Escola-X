class SubjectsController < ApplicationController
	include SessionsHelper
  def index
  	@subjects = Subject.all
  end
  def new
  	if ( is_principal? )
  		@subject = Subject.new
  	end
  end
  def create
  	if (is_principal?)
  		@subject = Subject.new(subject_params)
  		@teacher = Teacher.find_by_registry(params[:teacher_registry])
  		@subject.teacher_id = @teacher.id

  		if (@subject.save)
  			redirect_to @subject 
  		else
  			render 'new'
  		end
  	end
  end
  def destroy
  	
  end
  def edit
  	
  end
  def update
  	
  end
  private
  def subject_params
  	params.require(:subject).permit(:name_subject,:class_level,:teacher_id)
  end
end
