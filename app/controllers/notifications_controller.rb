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
      @assignee = User.exists?(@notification.notification_emitter_id) ? User.find_by_id(@notification.notification_emitter_id).name : "Desconhecido"
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
      @notification.notification_date = @notification.get_date
      # @notification.notification_hour = @notification.get_hour
      if (@notification.save)
        redirect_to notification_path(@notification),
          notice: "A notificação foi criada com sucesso."
      else
        render new_notification_path
      end
    end
  end

  def edit
    if ( is_employee? )
      @notification = Notification.find(params[:id])
    end
  end

  def update
    if ( is_employee? )
      @notification = Notification.find(params[:id])
      if ( @notification.update(notification_params) )
        redirect_to notification_path(@notification),
          notice: "A notificação foi criada com sucesso."
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
                                          :notification_text,
                                          :notification_emitter_id,
                                          :notification_date,
                                          :notification_hour)
  end
end
