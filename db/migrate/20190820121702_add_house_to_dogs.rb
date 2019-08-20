class AddHouseToDogs < ActiveRecord::Migration[6.0]
  def change
    add_reference :dogs, :house, null: false, foreign_key: true
  end
end
