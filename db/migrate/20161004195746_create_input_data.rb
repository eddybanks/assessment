class CreateInputData < ActiveRecord::Migration[5.0]
  def change
    create_table :input_data do |t|
      t.text :content

      t.timestamps
    end
  end
end
