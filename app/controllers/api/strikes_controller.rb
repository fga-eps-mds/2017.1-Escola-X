class Api::StrikesController < ApplicationController
  respond_to :json

  def index
    respond_with Strike.all
  end

  def show
    respond_with Strike.find(params[:id])
  end
end
