class AddDeptFieldToEmployee < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :department, :string
  end
end
