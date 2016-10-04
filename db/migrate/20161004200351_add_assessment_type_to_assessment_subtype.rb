class AddAssessmentTypeToAssessmentSubtype < ActiveRecord::Migration[5.0]
  def change
    add_reference :assessment_subtypes, :assessment_type, foreign_key: true
  end
end
