class CreateTemplates < ActiveRecord::Migration[5.0]
  def change
    create_table :templates do |t|
      t.string :name
      t.string :description
      t.references :assessment_type, foreign_key: true
      t.references :year, foreign_key: true

      t.timestamps
    end
  end
end
