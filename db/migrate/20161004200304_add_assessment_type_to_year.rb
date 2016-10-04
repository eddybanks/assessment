class AddAssessmentTypeToYear < ActiveRecord::Migration[5.0]
  def change
    add_reference :years, :assessment_type, foreign_key: true
  end
end
