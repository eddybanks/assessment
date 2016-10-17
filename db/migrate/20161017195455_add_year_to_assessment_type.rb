class AddYearToAssessmentType < ActiveRecord::Migration[5.0]
  def change
    add_reference :assessment_types, :year, foreign_key: true
  end
end
