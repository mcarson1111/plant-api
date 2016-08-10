class RemoveRegionsFruits < ActiveRecord::Migration
  def change
    remove_column :fruits, :regions, :string
  end
end
