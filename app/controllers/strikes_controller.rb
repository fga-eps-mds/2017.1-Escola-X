# File name: strikes_controller.rb
# Class name: StrikesController
# Description: Controller used to communicate with the proprietary view of strikes
class StrikesController < ApplicationController
  include SessionsHelper

  def index
    id = params[:alumn_id]

    if ( is_employee? or verify_alumn(id) or is_son?(id) )
      @@alumn = Alumn.find(id)
      @strikes = @@alumn.strikes
    end
  end

  def new
    if ( is_employee? )
      @@alumn = Alumn.find(params[:alumn_id])
      @strike = Strike.new
    end
  end

  def show
    if ( logged_in? )
      @strike = Strike.find(params[:id])
      @alumn = Alumn.find_by_id(@strike.alumn_id)
      @employee = Employee.find(@strike.employee_id)
    end
  end

  def create
    if ( is_employee? )
      @strike = @@alumn.strikes.create(strike_params)
      @strike.employee_id = @current_user.id
      if (@strike.save)
        # @alumn = Alumn.find_by_id(@strike.alumn_id)
        @@alumn.quantity_strike += 1
        if @@alumn.save
          redirect_to alumn_strike_path(@@alumn,@strike)
        else
          render 'strikes/new'
        end
      else
        render 'strikes/new'
      end
    end
  end

  def destroy
    if ( is_employee? )
      @strike = Strike.find(params[:id])
      @alumn = Alumn.find_by_id(@strike.alumn_id)
      if @strike.destroy
        @alumn.quantity_strike -= 1
        if @alumn.save
          redirect_to users_path
        end
      end
    end
  end

  def edit
    if ( is_employee? )
      @strike = Strike.find(params[:id])
      @alumn = Alumn.find_by_id(@strike.alumn_id)
    end
  end

  def update
    if ( is_employee? )
      @strike = Strike.find(params[:id])
      if @strike.update(strike_params)
        redirect_to strike_path(@strike)
      else
        render "strikes/edit"
      end
    end
  end

  private
  def strike_params
    params.require(:strike).permit(:description_strike,
                                 :date_strike,
                                 employee_attributes: [:employee_id],
                                 alumn_attributes: [:alumn_id])
  end
end
