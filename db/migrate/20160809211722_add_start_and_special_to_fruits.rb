class AddStartAndSpecialToFruits < ActiveRecord::Migration
  def change
    add_column :fruits, :start, :string
    add_column :fruits, :special, :string
  end
end
