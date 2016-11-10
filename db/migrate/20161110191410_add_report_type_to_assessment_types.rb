class AddReportTypeToAssessmentTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :assessment_types, :report_type, :integer
  end
end
