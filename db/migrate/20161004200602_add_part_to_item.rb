class AddPartToItem < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :part, foreign_key: true
  end
end
