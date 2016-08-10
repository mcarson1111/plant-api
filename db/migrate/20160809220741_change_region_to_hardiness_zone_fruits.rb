class ChangeRegionToHardinessZoneFruits < ActiveRecord::Migration
  def change
    remove_column :fruits, :region, :string

    add_column :fruits, :hardiness_zone, :string
  end
end
