class SchoolMissesController < ApplicationController
  include SessionsHelper

  def index
    if ( logged_in? )
      @misses = SchoolMiss.all
    end
  end

  def show
    if ( logged_in? )
      @miss = SchoolMiss.find(params[:id])
    end
  end

  def new
    if ( logged_in? )

    end
  end

  # will not be necessary when "beep" is implemented
  def create
    @miss = SchoolMiss.new(miss_params)
  end

  def edit

  end

  def update
  end

  def destroy
  end

  private
  def miss_params
    params.require(:school_miss).permit()
  end
end
