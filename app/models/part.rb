class Part < ApplicationRecord
  has_many    :items
  belongs_to  :assessment_unit
  belongs_to  :year
end
