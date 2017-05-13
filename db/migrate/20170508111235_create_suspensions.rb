class CreateSuspensions < ActiveRecord::Migration[5.0]
  def change
    create_table :suspensions do |t|
      t.string :title
      t.text :description
      t.integer :quantity_days
      t.references :alumn
      t.references :employee
      t.date        :date_suspension
      t.timestamps
    end
  end
end
