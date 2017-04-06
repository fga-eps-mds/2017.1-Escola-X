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
    @alumn = Alumn.new(alumn_params)

    @alumn.save
    redirect_to @alumn
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
