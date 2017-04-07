class UsersController < ApplicationController
  before_action :is_alumn, only: [:index,:show]
  before_action :is_parent, only: [:index,:show] 
  before_action :is_teacher, only: [:index,:show] #Maybe change?
  before_action :is_principal

end
