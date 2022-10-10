class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.integer :emp_id
      t.boolean :is_leader

      t.timestamps
    end
  end
end
