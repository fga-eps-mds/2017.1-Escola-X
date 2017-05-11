class SchoolMissesController < ApplicationController
  include SessionsHelper

  def index
    if ( logged_in? )
      @misses = @alumn.school_misses.all
    end
  end

  def show
    if ( logged_in? )
      @miss = SchoolMiss.find(params[:id])
    end
  end

  def new
    if ( is_employee? )
      @miss = SchoolMiss.new
    end
  end

  # will not be necessary when "beep" is implemented
  def create
    if ( is_employee? )
      @miss = SchoolMiss.new(miss_params)
      @miss.alumn_id = Alumn.current.id
      if ( @miss.save )
        redirect_to alumn_path(@miss.alumn_id)
      else
        render new_school_miss_path
      end
    end
  end

  def edit
    if ( is_employee? )
      @miss = SchoolMiss.find(params[:id])
    end
  end

  def update
    if ( is_employee? )
      @miss = SchoolMiss.find(params[:id])
      @miss.alumn_id = Alumn.current.id
      if ( @miss.update(miss_params) )
        redirect_to alumn_path(@miss.alumn_id)
      else
        render edit_school_miss_path
      end
    end
  end

  def destroy
    if ( is_principal? )
      @miss = SchoolMiss.find(params[:id])
      @miss = destroy

      redirect_to alumn_path(@alumn)
    end
  end

  private
  def miss_params
    params.require(:school_miss).permit(:date,:alumn_id)
  end
end
