# File name: subjects_controller.rb
# Class name: SubjectsController
# Description: Controller used to communicate with the proprietary view of subjects
class SubjectsController < ApplicationController
	include SessionsHelper

  def index
  	if ( is_principal? or is_teacher? )
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
  	if( is_principal? )
  		@subject = Subject.find(params[:id])
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
		end
  end

  def destroy
  	if ( is_principal? )
  		@subject = Subject.find(params[:id])
  		@subject.destroy
			flash[:alert] = "Turma excluída com sucesso"
  		redirect_to subjects_path
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
		end
  end

  private
  def subject_params
  	params.require(:subject).permit(:name_subject,:class_level,:teacher_id)
  end
end
