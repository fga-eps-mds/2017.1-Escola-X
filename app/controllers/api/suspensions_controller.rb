class Api::SuspensionsController < ApplicationController
  respond_to :json

  def index
    respond_with Suspension.all
  end

  def show
    respond_with Suspension.find(params[:id])
  end

end
