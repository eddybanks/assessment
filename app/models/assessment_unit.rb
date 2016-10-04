class AssessmentUnit < ApplicationRecord
  has_many    :parts
  belongs_to  :assessment_subtype
end
