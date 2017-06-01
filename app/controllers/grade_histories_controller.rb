class GradeHistoriesController < ApplicationController
  include SessionsHelper

  def self.create(grade,current_user)
      @grade_history = GradeHistory.new(grade_id: grade.id, employee_id: current_user.id)
      @grade_history.save
  end

  def show_history
    if is_principal? or is_secretary?
      @grade_histories = GradeHistory.where(grade_id:params[:grade_id])
    end
  end
end
