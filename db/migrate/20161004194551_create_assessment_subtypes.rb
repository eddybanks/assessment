class CreateAssessmentSubtypes < ActiveRecord::Migration[5.0]
  def change
    create_table :assessment_subtypes do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
