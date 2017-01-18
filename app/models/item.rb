class Item < ApplicationRecord
  has_one       :input_datum, dependent: :destroy
  has_one       :section, dependent: :destroy
  belongs_to    :input_type
  belongs_to    :part
  resourcify
end
