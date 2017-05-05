class NotificationsController < ApplicationController
  include SessionsHelper

  def index
    if ( logged_in? )
      @notifications = Notification.all
    end
  end

  def show
    if ( logged_in? )
      @notification = Notification.find(params[:id])
      @assignee = User.exists?(@notification.notification_emitter_id) ? User.id(@notification.notification_emitter_id).name : "Desconhecido"
    end
  end

  def new
    if ( is_employee? )
      @notification = Notification.new
    end
  end

  def create
    if ( is_employee? )
      @notification = Notification.new(notification_params)
      @notification.notification_emitter_id = @current_user.id
      if (@notification.save)
        redirect_to notification_path(@notification),
          notice: "A notificação foi criada com sucesso."
      else
        render new_notification_path
      end
    end
  end

  def update
    if ( is_employee? )
      @notification = Notification.find(params[:id])
      if ( @notification.update(notification_params) )
        redirect_to notification_path(@notification)
      else
        render edit_notification_path
      end
    end
  end

  def destroy
    if ( is_employee? )
      @notification = Notification.find(params[:id])
      @notification.destroy
      redirect_to notifications_path
    end
  end

  private
  def notification_params
    params.require(:notification).permit( :title,
                                          :notification_type,
                                          :notification_receiver,
                                          :notification_text,
                                          :notification_emitter_id,
                                          :notification_date,
                                          :notification_hour)
  end
end
