class AddStartAndSpecialToHerbs < ActiveRecord::Migration
  def change
    add_column :herbs, :start, :string
    add_column :herbs, :special, :string
  end
end
