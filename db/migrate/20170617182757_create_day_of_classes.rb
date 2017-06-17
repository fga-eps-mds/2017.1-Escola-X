class CreateDayOfClasses < ActiveRecord::Migration[5.0]
  def change
    create_table :day_of_classes do |t|
      t.date :date

      t.timestamps
    end
  end
end
