class StrikesController < ApplicationController
  include SessionsHelper
  def new
    if ( is_principal? )
      @@alumn = Alumn.find(params[:alumn_id])
      @strike = Strike.new
    end
  end
  def show
    if ( is_principal? )
      @strike = Strike.find(params[:id])
    end
  end

  def create
    if ( is_principal? )
      @strike = @@alumn.strike.create(strike_params)
      @strike.employee_id = @current_user.employee.id
      if (@strike.save)
        redirect_to strike_path(@strike)
      else
        render 'strike/new'
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
