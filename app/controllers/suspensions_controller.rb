# File name: suspensions_controller.rb
# Class name: SuspensionsController
# Description: Controller used to communicate with the proprietary view of suspensions
class SuspensionsController < ApplicationController
	include SessionsHelper

	def index
    if ( logged_in? )
      @@alumn = Alumn.find(params[:alumn_id])
      @suspensions = @@alumn.suspensions
    end
  end

	def new
		if ( is_principal? )
			@@alumn = Alumn.find(params[:alumn_id])
			@suspension = Suspension.new
		end
	end

	def show
		if ( logged_in? )
			@suspension = Suspension.find(params[:id])
			@alumn = Alumn.find_by_id(@suspension.alumn_id)
			@employee = Employee.find(@suspension.employee_id)
		end
	end

	def create
		if( is_principal? )
			@suspension = @@alumn.suspensions.create(suspension_params)
			@suspension.employee_id = @current_user.id
			if( @suspension.save )
				@alumn = Alumn.find_by_id(@suspension.alumn_id)
				if( @alumn.save )
					flash[:success] = "Suspensão criada com sucesso"
					redirect_to suspension_path(@suspension)
				else
					render 'suspensions/new'
				end
			else
				render 'suspensions/new'
			end
		end
	end

	def destroy
		if( is_principal? )
			@suspension = Suspension.find(params[:id])
			@alumn = Alumn.find_by_id(@suspension.alumn_id)
			if( @suspension.destroy )
				if( @alumn.save )
					flash[:alert] = "Suspensão excluída com sucesso"
					redirect_to users_path
				end
			end
		end
	end

	def edit
		if( is_principal? )
			@suspension = Suspension.find(params[:id])
			@alumn = Alumn.find_by_id(@suspension.alumn_id)
		end
	end

	def update
		if( is_principal? )
			@suspension = Suspension.find(params[:id])
			if( @suspension.update(suspension_params) )
				flash[:notice] = "Suspensão alterada com sucesso"
				redirect_to suspension_path(@suspension)
			else
				render "suspensions/edit"
			end
		end
	end

	private
	def suspension_params
		params.require(:suspension).permit(:title,
                               :description,
                               :quantity_days,
                               :employee_id,
                               :alumn_id,
															 :date_suspension)
	end
end
