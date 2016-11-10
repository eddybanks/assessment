class Year < ApplicationRecord
  has_many    :assessment_types
  has_many    :assessment_subtypes
  has_many    :assessment_units
  has_many    :parts
  resourcify
end
