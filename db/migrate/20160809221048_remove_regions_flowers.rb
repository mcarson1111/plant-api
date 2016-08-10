class RemoveRegionsFlowers < ActiveRecord::Migration
  def change
    remove_column :flowers, :regions, :string
  end
end
