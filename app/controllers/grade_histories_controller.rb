class GradeHistoriesController < ApplicationController
  def self.Create(grade)
    if is_principal? or is_secretary?
      @grade_history = GradeHistory.new(grade_id: grade.id, employee_id: @current_user.id)
      @grade_history.save
    end
  end

  def show_history
    if is_principal? or is_secretary?
      @grade_histories = find_by_grade_id(params[:id])
    end
  end
end
