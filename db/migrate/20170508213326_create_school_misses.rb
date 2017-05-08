class CreateSchoolMisses < ActiveRecord::Migration[5.0]
  def change
    create_table :school_misses do |t|
<<<<<<< HEAD
      t.belongs_to :alumn, index: true
=======
>>>>>>> 57e62e8... Makes a lot of changes. Log: modificado: app/controllers/school_misses_controller.rb
      t.date :date

      t.timestamps
    end
  end
end
