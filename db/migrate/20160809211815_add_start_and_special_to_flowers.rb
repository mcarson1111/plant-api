class AddStartAndSpecialToFlowers < ActiveRecord::Migration
  def change
    add_column :flowers, :start, :string
    add_column :flowers, :special, :string
  end
end
