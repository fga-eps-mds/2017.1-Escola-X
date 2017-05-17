class SchoolMissesController < ApplicationController
  include SessionsHelper

  def index
    if ( logged_in? )
      @misses = @alumn.school_misses.all
    end
  end

  def show
    #if ( logged_in? )
    #  @school_miss = SchoolMiss.find(params[:id])
    #end
  end

  def new
    if ( is_employee? )
      @school_miss = SchoolMiss.new
    end
  end

  # will not be necessary when "beep" is implemented
  def create
    if ( is_employee? )
      @school_miss = SchoolMiss.new(school_miss_params)
      @school_miss.alumn_id = Alumn.current.id
      if ( @school_miss.save )
        redirect_to alumn_path(@school_miss.alumn_id)
      else
        render new_school_miss_path
      end
    end
  end

  def edit
    if ( is_employee? )
     @school_miss = SchoolMiss.find(params[:id])
    # @alumn = Alumn.find_by_id(@school_miss.alumn_id)
    end
  end

  def update
    if ( is_employee? )
      # alumns/idalumn/school_misses/idmiss
      # @school_miss.alumn_id = Alumn.current.id
      #alumn = Alumn.find(params[:id])
      #@school_miss = alumn.school_misses.find(params[:id])
      @school_miss = SchoolMiss.find(params[:id])
      if ( @school_miss.update(school_miss_params) )
        redirect_to alumn_path(@school_miss.alumn_id)
      else
        # render edit_school_miss_path
      end
    end
  end

  def destroy
    if ( is_principal? )
      @school_miss = SchoolMiss.find(params[:id])
      @school_miss.destroy
      redirect_to alumn_path(@school_miss.alumn_id)
    end
  end

  private
  def school_miss_params
    params.require(:school_miss).permit(:date,:alumn_id)
  end
end
