class Template < ApplicationRecord
  has_many :forms
  belongs_to :assessment_type
  belongs_to :year
  resourcify
end
