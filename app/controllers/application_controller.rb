class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  puts "OI"
end
