class AssessmentSubtype < ApplicationRecord
  has_many    :assessment_units
  belongs_to  :assessment_type
  belongs_to  :year
end
