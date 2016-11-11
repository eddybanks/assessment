class AssessmentType < ApplicationRecord
  has_many    :templates, dependent: :destroy
  belongs_to  :year

  enum report_type: [:ar, :ap]
  scope :report_type, ->(rp) { where report_type: rp }
  resourcify
end
