class AddAssessmentSubtypeToAssessmentUnit < ActiveRecord::Migration[5.0]
  def change
    add_reference :assessment_units, :assessment_subtype, foreign_key: true
  end
end
