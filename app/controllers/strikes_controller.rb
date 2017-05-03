class StrikesController < ApplicationController
  include SessionsHelper
  def new
    if ( is_principal? )
      @strike = Strike.new
    end
  end

  def create
    @strike = Strike.new(strike_params)
    if (@strike.save)
      redirect_to strike_path(@strike)
    else
      render 'strike/new'
    end
  end

private
  def strike_params
    params.require(:strike).permit(:description_strike,
                                 :date_strike,
                                 employee_attributes: [:registry],
                                 alumn_attributes: [:registry])

  end

end
