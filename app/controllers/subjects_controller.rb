class SubjectsController < ApplicationController
	include SessionsHelper
  def index
  	if (logged_in?)
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
  		if (@teacher = Teacher.find_by_registry(params[:teacher_registry]))
    		@subject.teacher_id = @teacher.id
    		if (@subject.save)
    			redirect_to @subject
    		else
    			render 'new'
    		end
    	else
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
      if (@teacher = Teacher.find_by_registry(params[:teacher_registry]))
        @subject.teacher_id = @teacher.id
        if (@subject.save)
          redirect_to @subject
        else
          render 'edit'
        end
      else
        if (@subject.save)
          redirect_to @subject
        else
          render 'edit'
        end
      end
    end
  end

  private
  def subject_params
  	params.require(:subject).permit(:name_subject,:class_level,:teacher_id)
  end
end
