class AddAssessmentUnitToPart < ActiveRecord::Migration[5.0]
  def change
    add_reference :parts, :assessment_unit, foreign_key: true
  end
end
