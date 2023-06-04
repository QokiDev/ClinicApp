class CreatePatientCards < ActiveRecord::Migration[7.0]
  def change
    create_table :patient_cards do |t|
      t.references :department, null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: true
      t.references :patient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
