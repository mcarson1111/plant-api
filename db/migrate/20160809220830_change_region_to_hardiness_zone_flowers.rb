class ChangeRegionToHardinessZoneFlowers < ActiveRecord::Migration
  def change
    remove_column :flowers, :region, :string

    add_column :flowers, :hardiness_zone, :string
  end
end
