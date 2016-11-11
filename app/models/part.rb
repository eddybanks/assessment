class Part < ApplicationRecord
  has_many    :items, dependent: :destroy
  belongs_to  :form
  belongs_to  :year
  resourcify
end
