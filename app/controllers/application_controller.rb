# File name: application_controller.rb
# Class name: ApplicationController
# Description: All other controllers in turn inherit from ApplicationController

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end
