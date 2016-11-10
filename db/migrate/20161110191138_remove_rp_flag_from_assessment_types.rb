class RemoveRpFlagFromAssessmentTypes < ActiveRecord::Migration[5.0]
  def change
    remove_column :assessment_types, :rp_flag, :boolean
  end
end
