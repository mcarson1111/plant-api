class AddStartAndSpecialToVeggies < ActiveRecord::Migration
  def change
    add_column :veggies, :start, :string
    add_column :veggies, :special, :string
  end
end
