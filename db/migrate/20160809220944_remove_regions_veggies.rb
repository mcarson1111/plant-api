class RemoveRegionsVeggies < ActiveRecord::Migration
  def change
    remove_column :veggies, :regions, :string
  end
end
