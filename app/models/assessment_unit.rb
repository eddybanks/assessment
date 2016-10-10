class AssessmentUnit < ApplicationRecord
  has_many    :parts
  belongs_to  :assessment_subtype
  belongs_to  :year
end
