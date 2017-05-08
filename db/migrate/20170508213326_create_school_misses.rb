class CreateSchoolMisses < ActiveRecord::Migration[5.0]
  def change
    create_table :school_misses do |t|
      t.belongs_to :alumn, index: true
      t.date :date

      t.timestamps
    end
  end
end
