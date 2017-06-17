class Api::NotificationsController < ApplicationController
  respond_to :json

  def index
    respond_with Notification.all
  end

  def show
    respond_with Notification.find(params[:id])
  end
end
