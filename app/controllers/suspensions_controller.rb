class SuspensionsController < ApplicationController
	include SessionsHelper

	def index
		if (logged_in?)
			@@alumn = Alumn.find(params[:alumn_id])
			@suspensions = @@alumn.suspension
		end
	end

	def new
		if (is_principal?)
			@@alumn = Alumn.find(params[:alumn_id])
			@suspension = Suspension.new
		end
	end

	def show
		if (is_principal?)
			@suspension = Suspension.find(params[:id])
			@alumn = Alumn.find_by_id(@suspension.alumn_id)
			@user = User.find_by_id(@alumn.user_id)
			@employee = Employee.find(@suspension.employee_id)
		end
	end

	def create
		if(is_principal?)
			@suspension = @@alumn.suspension.create(suspension_params)
			@suspension.employee_id = @current_user.employee_id
			if(@suspension.save)
				@alumn = Alumn.find_by_id(@suspension.alumn_id)
				@alumn.quantity_suspensions_days = @suspension.quantity_days
				if(@alumn.save)
					redirect_to suspension_path(@suspension)
				else
					render 'suspensions/new'
				end
			else
				render 'suspensions/new'
			end
		end
	end

	##PENSAR EM COMO RESOLVER O PROBLEMA DO DESTROY
	def destroy
		if(is_principal?)
			@suspension = Suspension.find(params[:id])
			@alumn = Alumn.find_by_id(@suspension.alumn_id)
			if(@suspension.destroy)	
				if(@alumn.save)
					rendirect_to users_path
				end
			end
		end
	end

	def edit
		if(is_principal?)
			@suspension = Suspension.find(params[:id])
			@alumn = Alumn.find_by_id(@suspension.alumn_id)
			@user = User.find_by_id(@alumn.user_id)
		end
	end

	def update
		if(is_principal?)
			@suspension = Suspension.find(params[:id])
			if(@suspension.update(suspension_params))
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
																				 :employee_attributes: [:employee_id],
																				 :alumn_attributes: [:alumn_id])
		end
end
