class AddClassroomToAlumn < ActiveRecord::Migration[5.0]
  def change
    add_reference :alumns, :classroom, foreign_key: true
  end
end
