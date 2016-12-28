class AddFormToPart < ActiveRecord::Migration[5.0]
  def change
    add_reference :parts, :form, foreign_key: true
  end
end
