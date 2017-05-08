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
      @miss = SchoolMiss.new
      @alumn = Alumn.find(params[:id])
    end
  end

  # will not be necessary when "beep" is implemented
  def create
    if ( is_employee? )
      @miss = SchoolMiss.new(miss_params)
      @miss.alumn_id = @alumn.id
      if ( @miss.save )
        redirect_to @miss
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
      if ( @miss.update(parent_params) )
        redirect_to @miss
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
