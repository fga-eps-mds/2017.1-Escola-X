class CreateSchoolMisses < ActiveRecord::Migration[5.0]
  def change
    create_table :school_misses do |t|
      t.date :date

      t.timestamps
    end
  end
end
