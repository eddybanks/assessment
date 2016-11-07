class CreateForms < ActiveRecord::Migration[5.0]
  def change
    create_table :forms do |t|
      t.string :name
      t.string :description
      t.references :template, foreign_key: true
      t.references :year, foreign_key: true

      t.timestamps
    end
  end
end
