class CreateDepartments < ActiveRecord::Migration[7.0]
  def change
    create_table :departments do |t|
      t.string :name
      t.string :address
      t.date :founding_date

      t.timestamps
    end
  end
end
