class CreateParents < ActiveRecord::Migration[5.0]
  def change
    create_table :parents do |t|
      t.string :cpf_parent
      t.string :string

      t.timestamps
    end
  end
end
