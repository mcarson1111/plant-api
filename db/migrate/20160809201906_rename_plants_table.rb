class RenamePlantsTable < ActiveRecord::Migration
  def change
    rename_table :plants, :veggies
  end
end
