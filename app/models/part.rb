class Part < ApplicationRecord
  has_many    :items
  belongs_to  :form
  belongs_to  :year
  resourcify
end
