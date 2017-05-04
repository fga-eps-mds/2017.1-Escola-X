class CreateParents < ActiveRecord::Migration[5.0]
  def change
    create_table :parents do |t|
    	t.string :name
    	t.string :address
    	t.string :phone
    	t.string :gender
    	t.string :birth_date
    	t.string :parent_cpf

    	t.timestamps
    end
  end
end
