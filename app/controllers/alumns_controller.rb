class AlumnsController < ApplicationController
  def index
    @alumns = Alumn.all
  end

  def show
    @alumn = Alumn.find( alumn_params )
  end

  def new
    
  end

  def edit

  end

  def create

  end

  def update

  end

  def destroy

  end

  private
  # Strong params to be passed to a alumn
  def alumn_params

  end
end
