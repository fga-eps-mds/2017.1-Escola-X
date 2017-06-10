class Api::AlumnsController < ApplicationController
  respond_to :json

  def index
    respond_with Alumn.all
  end

  def show
    respond_with Alumn.find(params[:id])
  end
end
