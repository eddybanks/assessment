class Template < ApplicationRecord
  has_many :forms, dependent: :destroy
  belongs_to :assessment_type
  belongs_to :year
  resourcify
end
