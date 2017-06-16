class Api::ParentsController < ApplicationController
  respond_to :json

  def index
    respond_with Parent.all
  end

  def show
    respond_with Parent.find(params[:id])
  end
end
