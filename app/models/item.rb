class Item < ApplicationRecord
  has_one       :input_datum, dependent: :destroy
  belongs_to    :input_type
  resourcify
end
