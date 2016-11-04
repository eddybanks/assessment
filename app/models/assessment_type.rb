class AssessmentType < ApplicationRecord
  has_many    :assessment_subtypes
  belongs_to  :year
  scope :ar, -> { where (rp_flag: true )}
  scope :ap, -> { where (rp_flag: false )}
end
