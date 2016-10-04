class AddItemToInputData < ActiveRecord::Migration[5.0]
  def change
    add_reference :input_data, :item, foreign_key: true
  end
end
