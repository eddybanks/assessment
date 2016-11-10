class Form < ApplicationRecord
  belongs_to :template
  belongs_to :year
  resourcify
end
