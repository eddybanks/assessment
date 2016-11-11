class Form < ApplicationRecord
  has_many :parts, dependent: :destroy
  belongs_to :template
  belongs_to :year
  resourcify

  paginates_per 10
end
