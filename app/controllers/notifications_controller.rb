# File name: notifications_controller.rb
# Class name: NotificationsController
# Description: Controller used to communicate with the proprietary view of notifications
class NotificationsController < ApplicationController
  include SessionsHelper

  def index
    if ( logged_in? )
      @notifications = Notification.all
    else
      redirect_to "/errors/error_500"
    end
  end

  def show
    if ( logged_in? )
      @notification = Notification.find(params[:id])
      @assignee = Employee.exists?(@notification.employee_id) ? Employee.find_by_id(@notification.employee_id).name : "Desconhecido"
    end
  end

  def new
    if ( is_employee? )
      @notification = Notification.new
    else
      redirect_to "/errors/error_500"
    end
  end

  def create
    if ( is_employee? )
      @notification = Notification.new(notification_params)
      @notification.employee_id = @current_user.id
      @notification.notification_date = @notification.get_date
      if (@notification.save)
        flash[:success] = "A notificação foi criada com sucesso."
        redirect_to notification_path(@notification)
      else
        render new_notification_path
      end
    else
      redirect_to "/errors/error_500"
    end
  end

  def edit
    if ( is_employee? )
      @notification = Notification.find(params[:id])
    else
      redirect_to "/errors/error_500"
    end
  end

  def update
    if ( is_employee? )
      @notification = Notification.find(params[:id])
      if ( @notification.update(notification_params) )
        flash[:notice] = "A notificação foi alterada com sucesso."
        redirect_to notification_path(@notification)
      else
        render edit_notification_path
      end
    else
      redirect_to "/errors/error_500"
    end
  end

  def destroy
    if ( is_employee? )
      @notification = Notification.find(params[:id])
      @notification.destroy
      flash[:alert] = "Notificação excluída com sucesso"
      redirect_to notifications_path
    else
      redirect_to "/errors/error_500"
    end
  end

  private
  def notification_params
    params.require(:notification).permit( :title,
                                          :motive,
                                          :notification_text,
                                          :employee_id,
                                          :notification_date,
                                          :notification_hour)
  end
end
