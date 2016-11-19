class AddInputTypeToItem < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :input_type, foreign_key: true
  end
end
