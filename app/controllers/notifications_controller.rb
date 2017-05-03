class NotificationsController < ApplicationController
  include SessionsHelper

  def index
    @notifications = Notification.all
  end

  def new
    @notification = Notification.new
  end

  def create
    @notification = Notification.new(notification_params)
    if (@notification.save)
      redirect_to notification_path(@notification)
    else
      render new_notification_path
    end
  end

  def update
    @notification = Notification.find(params[:id])
    if ( @notification.update(notification_params) )
      redirect_to notification_path(@notification)
    else
      render edit_notification_path
    end
  end

  def destroy
    @notification = Notification.find(params[:id])
    @notification.destroy
    redirect_to notifications_path
  end

  private

  def notification_params
    params.require(:notification).permit( :title,
                                          :notification_type,
                                          :notification_text,
                                          :notification_emitter_id,
                                          :notification_date,
                                          :notification_hour)
  end
end
