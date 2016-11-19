class Year < ApplicationRecord
  has_many    :assessment_types
  has_many    :templates
  has_many    :forms
  has_many    :parts
  resourcify
end
