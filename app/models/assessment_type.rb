class AssessmentType < ApplicationRecord
  has_many    :assessment_subtypes
  belongs_to  :year
end
