class ChangeCpfOfEmployee < ActiveRecord::Migration[5.0]
  def change
    rename_column :employees, :cpf, :employee_cpf
  end
end
