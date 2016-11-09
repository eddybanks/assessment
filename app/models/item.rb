class Item < ApplicationRecord
  has_one       :input_datum
  belongs_to    :input_type
  resourcify
end
