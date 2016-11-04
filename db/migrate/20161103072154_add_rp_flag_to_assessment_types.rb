class AddRpFlagToAssessmentTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :assessment_types, :rp_flag, :boolean
  end
end
