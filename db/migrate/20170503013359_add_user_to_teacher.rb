class AddUserToTeacher < ActiveRecord::Migration[5.0]
  def change
    add_reference :teachers, :user, foreign_key: true
  end
end
